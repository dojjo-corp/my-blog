import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/pages/account_configuration.dart';
import 'authentication/pages/app_settings.dart';
import 'authentication/pages/dashboard.dart';
import 'global/home_page.dart';
import 'authentication/pages/login_screen.dart';
import 'authentication/pages/sign_up.dart';
import 'authentication/providers/user_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<UserProvider>(
    create: (_) => UserProvider(),
    child: const MyApp(),
  ));
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
