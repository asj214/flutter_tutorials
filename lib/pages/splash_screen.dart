import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tutorials/constants.dart';
import 'package:flutter_tutorials/utils/token.dart';
import 'package:flutter_tutorials/utils/user_state.dart';
import 'package:flutter_tutorials/apis/member.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  String? token;

  @override
  void initState () {
    super.initState();
    checkTokenLogin();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, '/home');
    // });
  }

  void checkTokenLogin() async {
    // 최소 3초간 노출
    await Future.delayed(const Duration(seconds: 3));
    token = await getToken();
    if (token != null && token!.isNotEmpty) {
      final member = await currentMember(token);

      if (!mounted) return;

      final userState = Provider.of<UserState>(context, listen: false);
      userState.setLogin(member);
      Navigator.pushReplacementNamed(context, '/home');
    }

    // API 통신이 지연되는 경우 스플래시 스크린 지연 노출
    setState(() {}); // 스플래시 스크린 갱신
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'Splash',
          style: TextStyle(fontSize: 40, color: primaryTextColor),
        )
      ),
    );
  }
}