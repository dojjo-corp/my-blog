import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dojjoblog/authentication/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../repository/firestore_repo.dart';

class NewBlog extends StatelessWidget {
  const NewBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CreateBlog extends StatefulWidget {
  const CreateBlog({super.key});

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  final store = FirestoreRepo();
  final firestore = FirebaseFirestore.instance;
  final _key = GlobalKey<FormState>();
  final _currentUser = FirebaseAuth.instance.currentUser;
  final contentController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Your Blog'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[700],
        ),
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      label: const Text('Title'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: const Text('Blog content')),
                    autofocus: true,
                    controller: contentController,
                    minLines: 10,
                    maxLines: 50,
                  ),
                  Center(
                    child: MyButton(
                      label: 'Create Blog',
                      onTap: () async {
                        store.createBlog(
                            author: _currentUser?.email ?? 'null-author',
                            title: titleController.text,
                            imgPath: '',
                            content: contentController.text);
                        contentController.text = '';
                        titleController.text = '';
                        // add to user's blog list
                        final userDoc = firestore.collection('users').doc(_currentUser?.uid);
                        
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
