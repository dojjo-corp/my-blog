import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Map<String, String> currentUser = {
    'name': '',
    'password': '',
  };

  void setCurrentUser({String? name, String? password}) {
    currentUser['name'] = name!;
    currentUser['password'] = password!;
  }
}