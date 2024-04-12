import 'package:flutter/material.dart';
import 'package:flutter_tutorials/apis/member.dart';

class UserState extends ChangeNotifier {
  bool isLogin = false;
  Member? info;

  void setLogin(Member info) {
    isLogin = true;
    info = info;
    notifyListeners();
  }

  void setLogout() {
    isLogin = false;
    info = null;
    notifyListeners();
  }
}