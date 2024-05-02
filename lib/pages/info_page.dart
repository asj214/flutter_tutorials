import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tutorials/apis/member.dart';
import 'package:flutter_tutorials/utils/user_state.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    final String isLogin = (userState.isLogin) ? 'true': 'false';

    Member? currentUser;

    inspect(userState.info);
    if (userState.info != null) {
      currentUser = userState.info;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Info Page'),
            Text('isLogin: $isLogin'),
            Text('user name: ${currentUser?.name}'),
          ]
        )
      )
    );
  }
}