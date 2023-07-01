import 'package:dojjoblog/components/drawer.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dojjoblog/pages/dashboard.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        drawer: const MyDrawer(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [],
          ),
        ),
        
      ),
    );
  }
}
