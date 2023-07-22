
import 'package:flutter/material.dart';
// ignore: unused_import

import '../../global/drawer.dart';

// to hold data from json file
List<Map<String, dynamic>> data = [{}];


class BlogDetails extends StatelessWidget {
  const BlogDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Blog'),
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // todo: actual blog data will be from JSON files
                const Row(
                  children: [
                    Text(
                      'Blog Topic',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
                Image.asset('assets/influencer.png'),
                const Row(
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                    VerticalDivider(),
                    Text(
                      'Time',
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                    VerticalDivider(
                      thickness: 16,
                      width: 50,
                    ),
                    Text(
                      'Author',
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0,),
                const Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.''',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Icon(Icons.add_comment_rounded),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
