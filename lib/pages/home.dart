import 'package:flutter/material.dart';

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
              Navigator.of(context).pushNamed('/splashScreen');
            },
            child: const Text('Splash Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/photos');
            },
            child: const Text('Photo List'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/memberRegister');
            },
            child: const Text('Member Join'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/memberLogin');
            },
            child: const Text('Login Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/infoPage');
            },
            child: const Text('info Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/chartPage');
            },
            child: const Text('Charts'),
          ),
        ]
      )
    );
  }
}