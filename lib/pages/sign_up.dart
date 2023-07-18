import 'package:dojjoblog/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:dojjoblog/components/text_field.dart';
import 'package:dojjoblog/components/my_button.dart';
import 'package:provider/provider.dart';

import '../components/square_icons.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.app_registration_rounded,
                  size: 100,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'We\'re glad to have you join us!',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    obscureText: false,
                    hintText: 'Fullname',
                    controller: nameController,
                    labelText: const Text('Fullname')),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    obscureText: false,
                    hintText: 'Email',
                    controller: emailController,
                    labelText: const Text('Email')),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    obscureText: true,
                    hintText: 'Password',
                    controller: passwordController,
                    labelText: const Text('Password')),
                const SizedBox(
                  height: 15
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyButton(
                    label: 'sign up',
                    onTap: () {
                      userProvider.setCurrentUser(
                        name: nameController.value.text,
                        password: passwordController.value.text,
                        email: emailController.value.text,
                      );
                      Navigator.popAndPushNamed(context, '/dashboard');
                      // ignore: avoid_print
                      print('You\'ve signed up!');
                    },
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(
                  height: 30,
                ),
                // google and apicons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareIcons(
                        imagePath: 'assets/google.png',
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/dashboard');
                          // ignore: avoid_print
                          print('Google sign up');
                        }),
                    const SizedBox(width: 10),
                    SquareIcons(
                        imagePath: 'assets/apple.png',
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/dashboard');
                          // ignore: avoid_print
                          print('Apple sign up');
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
