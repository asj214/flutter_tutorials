import 'package:flutter/material.dart';
import 'package:flutter_tutorials/apis/member.dart';

class UserState extends ChangeNotifier {
  bool isLogin = false;
  Member? _info;
  Member? get info => _info;

  void setLogin(Member info) {
    isLogin = true;
    _info = info;
    notifyListeners();
  }

  void setLogout() {
    isLogin = false;
    _info = null;
    notifyListeners();
  }
}