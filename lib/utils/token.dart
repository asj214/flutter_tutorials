import 'package:shared_preferences/shared_preferences.dart';

// JWT 토큰 저장
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('jwtToken', token);
}

// 저장된 JWT 토큰 가져오기
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('jwtToken');
}

// 저장된 JWT 토큰 삭제
Future<void> deleteToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('jwtToken');
}