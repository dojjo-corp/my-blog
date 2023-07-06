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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imgPath,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  "Date",
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
                VerticalDivider(
                  thickness: 10,
                  color: Colors.black,
                  width: 16,
                ),
                Text(
                  "Time",
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Text(
              "Blog Topic",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              style: TextStyle(
                fontSize: 14,
              ),
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
      ),
    );
  }
}
