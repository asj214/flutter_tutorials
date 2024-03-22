import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(
            color: primaryTextColor
          ),
          titleTextStyle: TextStyle(color: primaryTextColor, fontSize: 20),
          toolbarHeight: 45
        )
      ),
    );
  }
}

