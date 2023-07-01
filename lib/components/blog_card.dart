import 'package:dojjoblog/pages/blogs.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.imgPath,
  });

  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            fit: BoxFit.cover,
          ),
          const Text(
            "Blog Heading",
            style: TextStyle(fontSize: 12, color: Colors.blueGrey),
          ),
          const Text(
            "Blog Sub Heading",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const BlogDetails()));
            },
            child: const Text("Read more"),
          )
        ],
      ),
    );
  }
}
