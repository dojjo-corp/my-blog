import 'package:flutter/material.dart';

class AccountConfig extends StatelessWidget {
  const AccountConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Placeholder(
                color: Theme.of(context).primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
