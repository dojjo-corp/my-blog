import 'package:flutter/material.dart';
import 'package:dojjoblog/components/drawer.dart';
// ignore: depend_on_referenced_packages
import 'package:dojjoblog/components/blog_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        drawer: const MyDrawer(),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlogCard(imgPath: '',),
                SizedBox(height: 20,),
                BlogCard(imgPath: '',),
                SizedBox(height: 20,),
                BlogCard(imgPath: '',),
                SizedBox(height: 20,),
                BlogCard(imgPath: '',),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // ignore: avoid_print
          onPressed: (){print('Create New Blog!');},
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
