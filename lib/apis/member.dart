import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tutorials/constants.dart';

class Member {
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Member({
    required this.email,
    required this.name,
    required this.createdAt,
    required this.updatedAt
  });
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