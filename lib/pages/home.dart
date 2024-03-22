import 'package:flutter/material.dart';
import 'package:flutter_tutorials/constants.dart';
import 'splash_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
          style: TextStyle(color: primaryTextColor)
        ),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                debugPrint('Home');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              child: const Text('Splash Screen'),
            ),
          ],
        )
      )
    );
  }
}