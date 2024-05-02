import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tutorials/constants.dart';

class Member {
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastLoginAt;

  const Member({
    required this.email,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.lastLoginAt
  });
}

Future<Member?> currentMember(String? token) async {
  final resp = await http.get(
    Uri.parse('${baseApiUrl}auth/me'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    }
  );

  final respBody = jsonDecode(resp.body);

  if (resp.statusCode == 200) {
    return Member(
      email: respBody['email'],
      name: respBody['name'],
      createdAt: DateTime.parse(respBody['created_at']),
      updatedAt: DateTime.parse(respBody['updated_at']),
      lastLoginAt: DateTime.parse(respBody['last_login'])
    );
  }

  return null;
}

class RegisterMember {
  final String email;
  final String name;
  final String password;

  const RegisterMember({
    required this.email,
    required this.name,
    required this.password
  });

  // RegisterMember 객체를 JSON으로 변환하는 메서드 추가
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }
}

Future<http.Response> registerMember(RegisterMember member) async {
  return await http.post(
    Uri.parse('${baseApiUrl}auth/register'),
    body: jsonEncode(member.toJson()),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    }
  );
}

class LoginData {
  final String email;
  final String password;

  const LoginData({
    required this.email,
    required this.password
  });
}

class LoginRespData {
  final String email;
  final String name;
  final String token;

  const LoginRespData({
    required this.email,
    required this.name,
    required this.token
  });
}

Future<LoginRespData> loginMember(LoginData member) async {
  final resp = await http.post(
    Uri.parse('${baseApiUrl}auth/login'),
    body: jsonEncode({
      'email': member.email,
      'password': member.password
    }),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    }
  );

  if (resp.statusCode != 200) {
    // 응답 상태 코드가 200이 아닌 경우에는 실패로 처리
    throw Exception('Failed to login: ${resp.statusCode}');
  } else {
    final respBody = jsonDecode(resp.body);
    return LoginRespData(
      email: respBody['email'],
      name: respBody['name'],
      token: respBody['token']
    );
  }
}