import 'package:dojjoblog/pages/create_blog.dart';
import 'package:flutter/material.dart';
import 'package:dojjoblog/components/drawer.dart';
// ignore: depend_on_referenced_packages
import 'package:dojjoblog/components/blog_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('My Dashboard'),
        ),
        drawer: const MyDrawer(),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                  child: Text(
                    'This is where stories are made',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                  ),
                ),
                BlogCard(
                  imgPath: 'assets/copywriting.png',
                ),
                SizedBox(
                  height: 20,
                ),
                BlogCard(
                  imgPath: 'assets/influencer (1).png',
                ),
                SizedBox(
                  height: 20,
                ),
                BlogCard(
                  imgPath: 'assets/influencer (2).png',
                ),
                SizedBox(
                  height: 20,
                ),
                BlogCard(
                  imgPath: 'assets/influencer.png',
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // ignore: avoid_print
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const CreateBlog()));
            // ignore: avoid_print
            print('Create New Blog!');
          },
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
