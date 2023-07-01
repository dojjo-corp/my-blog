import 'package:dojjoblog/pages/login_screen.dart';
import 'package:dojjoblog/pages/sign_up.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To The Dojjo BlogSpace',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                // letterSpacing: 2.0,
                // wordSpacing: 10.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
