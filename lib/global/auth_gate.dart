import 'package:dojjoblog/authentication/pages/dashboard.dart';
import 'package:dojjoblog/authentication/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth= FirebaseAuth.instance;
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Dashboard();
        } else {
          return const LoginPage();
        }
      },
      stream: auth.authStateChanges(),
    );
  }
}
