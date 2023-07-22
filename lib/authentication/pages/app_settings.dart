import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('App Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Placeholder(
                color: Theme.of(context).primaryColorLight,
                fallbackHeight: 50,
              ),
              const SizedBox(height: 10,),
              Placeholder(
                color: Theme.of(context).primaryColorLight,
                fallbackHeight: 50,
              ),
              const SizedBox(height: 10,),
              Placeholder(
                color: Theme.of(context).primaryColorLight,
                fallbackHeight: 50,
              ),
              const SizedBox(height: 10,),
              Placeholder(
                color: Theme.of(context).primaryColorLight,
                fallbackHeight: 50,
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
