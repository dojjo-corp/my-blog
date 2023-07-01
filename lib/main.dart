import 'package:dojjoblog/pages/account_configuration.dart';
import 'package:dojjoblog/pages/app_settings.dart';
import 'package:dojjoblog/pages/dashboard.dart';
import 'package:dojjoblog/pages/home_page.dart';
import 'package:dojjoblog/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dojjoblog/pages/sign_up.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/dashboard': (context) => const Dashboard(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUp(),
        '/accountConfig': (context) => const AccountConfig(),
        '/appSettings': (context) => const AppSettings(),
      },
    );
  }
}

