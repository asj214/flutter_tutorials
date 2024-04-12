import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'pages/home.dart';
import 'pages/splash_screen.dart';
import 'pages/photos/photo_list.dart';
import 'pages/member/member_join.dart';
import 'pages/member/login.dart';
import 'utils/user_state.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(),
      child: const MainApp()
    )
  );
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
      routes: {
        '/home': (context) => const Home(),
        '/splashScreen': (context) => const SplashScreen(),
        '/photos': (context) => const PhotoList(),
        '/memberRegister': (context) => const MemberJoin(),
        '/memberLogin': (context) => const Login(),
      }
    );
  }
}

