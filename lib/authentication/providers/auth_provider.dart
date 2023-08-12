import 'dart:developer';

import 'package:dojjoblog/authentication/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final repo = AuthRepository();

  Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      return await repo.login(email: email, password: password);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<UserCredential?> register({
    required String email,
    required String password,
    required String fName,
    required String lName,
    required String username,
  }) async {
    try {
      final user = await repo.register(
        email: email,
        password: password,
        fName: fName,
        lName: lName,
        username: username,
      );
      // print(user.user);
      return user;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
