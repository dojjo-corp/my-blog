import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepo {
  final store = FirebaseFirestore.instance;

  Future<void> createUserDoc({
    required String fName,
    required String lName,
    required String email,
    required String username,
    List<String> blogs = const [],
  }) async {
    final auth = FirebaseAuth.instance;
    final Map<String, dynamic> userData = {
      'first-name': fName,
      'last-name': lName,
      'email': email,
      'blogs': blogs,
    };
    await store
        .collection('users')
        .doc(auth.currentUser?.uid)
        .set(userData, SetOptions(merge: true));
  }

  Future<void> createBlog({
    required String author,
    required String title,
    required String imgPath,
    required String content,
    int likes = 0,
    List<String> comments = const [],
  }) async {
    // get time
    final d = DateTime.now();
    final time = {
      'date': '${d.year}-${d.month}-${d.day}',
      'time': '${d.hour}:${d.minute}',
    };

    final Map<String, dynamic> blogData = {
      'title': title,
      'author': author,
      'title-image': 'assets/influencer.png', // temp image to use
      'content': content,
      'time-created': time,
      'likes': likes,
      'comments': comments,
    };

    store
        .collection('blogs')
        .doc(blogData['author'].toLowerCase())
        .collection('user\'s blogs')
        .doc(blogData['title'])
        .set(blogData, SetOptions(merge: true));
  }
}
