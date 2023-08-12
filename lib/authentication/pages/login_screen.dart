// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dojjoblog/authentication/pages/sign_up.dart';
import 'package:dojjoblog/authentication/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/square_icons.dart';
import '../components/text_field.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _key = GlobalKey<FormState>();

  // other authorization sign in
  void oAuthSignIn({String? server}) {}

  // forgot password
  void passworForgotten() {}

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // logo
                const Icon(
                  Icons.login_rounded,
                  size: 150,
                ),
                const SizedBox(height: 20),

                // Welcome back, you've been missed
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'You\'ve been missed!',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //userName TextField
                MyTextField(
                  labelText: const Text('Email'),
                  obscureText: false,
                  hintText: 'Email',
                  controller: emailController,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter email' : null;
                  },
                ),
                const SizedBox(height: 10),

                // password TextField
                MyTextField(
                  labelText: const Text('Password'),
                  obscureText: true,
                  hintText: 'Password',
                  controller: passwordController,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter password' : null;
                  },
                ),
                const SizedBox(height: 15),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      print('You have forgotten your password');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'forgot password?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // login button
                MyButton(
                  label: 'login',
                  onTap: () async {
                    if (_key.currentState!.validate() &&
                        await authProvider.login(
                              email: emailController.text,
                              password: passwordController.text,
                            ) !=
                            null) {
                      _key.currentState?.save();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()));
                    }
                  },
                ),
                const SizedBox(height: 30),

                // or continue with
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 5,
                        endIndent: 5,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      'Or continue with',
                    ),
                    Expanded(
                      child: Divider(height: 5, indent: 5, thickness: 2),
                    )
                  ],
                ),
                const SizedBox(height: 30),

                // google and apicons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareIcons(
                        imagePath: 'assets/google.png',
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/dashboard');
                          print('Google sign up');
                        }),
                    const SizedBox(width: 10),
                    SquareIcons(
                        imagePath: 'assets/apple.png',
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/dashboard');
                          print('Apple sign up');
                        }),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not having an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
