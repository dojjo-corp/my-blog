import 'package:dojjoblog/authentication/providers/auth_provider.dart';
import 'package:dojjoblog/global/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/pages/account_configuration.dart';
import 'authentication/pages/app_settings.dart';
import 'authentication/pages/dashboard.dart';
import 'authentication/pages/login_screen.dart';
import 'authentication/pages/sign_up.dart';
import 'authentication/providers/user_provider.dart';
// firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey[50]!),
        useMaterial3: true,
      ),
      home: const AuthGate(),
      routes: {
        '/dashboard': (context) => const Dashboard(),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => SignUp(),
        '/accountConfig': (context) => const AccountConfig(),
        '/appSettings': (context) => const AppSettings(),
      },
    );
  }
}
