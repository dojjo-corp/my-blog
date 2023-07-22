import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Map<String, String> currentUser = {
    'name': '',
    'password': '',
    'email': '',
  };

  void setCurrentUser({String? name, String? password, String? email}) {
    currentUser['name'] = name!;
    currentUser['password'] = password!;
    currentUser['email'] = email ?? 'not-real@dojjo.corp';
  }
}