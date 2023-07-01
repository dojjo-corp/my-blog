import 'package:flutter/material.dart';
import 'package:dojjoblog/components/text_field.dart';
import 'package:dojjoblog/components/my_button.dart';


class SignUp extends StatelessWidget {
  SignUp({super.key});

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                Icon(Icons.app_registration_rounded, size: 100, color: Colors.grey[700],),
                const SizedBox(height: 30,),
                const Text(
                  'We\'re glad to have you join us!',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 30,),
                MyTextField(
                  obscureText: false, 
                  hintText: 'Fullname', 
                  controller: nameController, 
                  labelText: const Text('Fullname')
                ),
                const SizedBox(height: 15,),
                MyTextField(
                  obscureText: false, 
                  hintText: 'Email', 
                  controller: emailController, 
                  labelText: const Text('Email')
                ),
                const SizedBox(height: 15,),
                MyTextField(
                  obscureText: true, 
                  hintText: 'Password', 
                  controller: passwordController,
                  labelText: const Text('Password')
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyButton(
                    label: 'sign up',
                    onTap: () {
                      print('You\'ve signed up!');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}