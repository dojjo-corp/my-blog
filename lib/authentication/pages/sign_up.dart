import 'package:dojjoblog/authentication/components/my_button.dart';
import 'package:dojjoblog/authentication/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../components/my_button.dart';
import '../components/square_icons.dart';
import '../components/text_field.dart';
import '../providers/auth_provider.dart';
// import '../providers/user_provider.dart';
import 'dashboard.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final usernameController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    // Future<void> register() async {

    // }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
        ),
        backgroundColor: Colors.grey[300],
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Icon(
                      Icons.app_registration_rounded,
                      size: 100,
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Join us, ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'We\'re glad to have you join us!',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextField(
                            obscureText: false,
                            hintText: 'First name',
                            controller: fNameController,
                            labelText: const Text('First name'),
                            validator: (value) {
                              return value!.isEmpty ? 'Enter first name' : null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            obscureText: false,
                            hintText: 'Last name',
                            controller: lNameController,
                            labelText: const Text('Last name'),
                            validator: (value) {
                              return value!.isEmpty ? 'Enter last name' : null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      obscureText: false,
                      hintText: 'Email',
                      controller: emailController,
                      labelText: const Text('Email'),
                      validator: (value) {
                        return value!.isEmpty ? 'Enter emaill' : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextField(
                            obscureText: true,
                            hintText: 'Password',
                            controller: passwordController,
                            labelText: const Text('Password'),
                            validator: (value) {
                              return value!.isEmpty ? 'Enter password' : null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            obscureText: true,
                            hintText: 'Confirm password',
                            controller: confirmPasswordController,
                            labelText: const Text('Confirm password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field cannot be empty';
                              } else if (value != passwordController.text) {
                                return 'passwords do not match!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                        label: 'register',
                        onTap: () async {
                          if (_key.currentState!.validate() &&
                              await authProvider.register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      fName: fNameController.text,
                                      lName: lNameController.text,
                                      username: usernameController.text) !=
                                  null) {
                            _key.currentState?.save();
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Dashboard()));
                          }
                        }),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(height: 5, endIndent: 5, thickness: 2),
                        ),
                        Text('Or continue with'),
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
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
