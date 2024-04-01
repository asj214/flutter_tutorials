import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'photos/photo_list.dart';
import 'member/member_join.dart';
import 'member/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
        ),
      ),
      body: Wrap(
        direction: Axis.horizontal, // 나열 방향
        alignment: WrapAlignment.start,
        spacing: 4, // 좌우 간격
        runSpacing: 5, // 상하 간격
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            },
            child: const Text('Splash Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PhotoList(),
                ),
              );
            },
            child: const Text('Photo List'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MemberJoin(),
                ),
              );
            },
            child: const Text('Member Join'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            child: const Text('Login Page'),
          ),
        ]
      )
    );
  }
}