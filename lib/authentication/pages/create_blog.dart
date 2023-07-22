import 'package:flutter/material.dart';

class NewBlog extends StatelessWidget {
  const NewBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CreateBlog extends StatelessWidget {
  const CreateBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Create Your Blog')),
        body: const Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
