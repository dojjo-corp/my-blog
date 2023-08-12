import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

// ignore: depend_on_referenced_packages

import '../components/blog_card.dart';
import '../../global/drawer.dart';
import '../models/blog_model.dart';
import 'create_blog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final blogs = blogList;

  void restartApp() {
    // Restart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('${currentUser?.displayName}\'s Dashboard'),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  restartApp();
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('This is where stories are made'),
            ),
            Expanded(
              child: SizedBox(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('blogs')
                      .doc(currentUser?.email)
                      .collection('user\'s blogs')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No blogs to display yet'),
                      );
                    }

                    final blogList = snapshot.data!.docs;
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final blogData = blogList[index].data();
                          final d = blogData['time-created'].toString();

                          return BlogCard(
                            intro: blogData['content'],
                            imgPath: blogData['title-image'],
                            title: blogData['title'],
                            timeCreated: blogData['time-created'],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: blogList.length);
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const CreateBlog()));
            // ignore: avoid_print
            print('Create New Blog!');
          },
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
