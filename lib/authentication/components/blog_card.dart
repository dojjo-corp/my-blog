import 'package:flutter/material.dart';

import '../pages/blogs.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.imgPath,
    required this.title,
    required this.timeCreated,
    required this.intro,
  });

  final String imgPath;
  final String title;
  final Map<String, dynamic> timeCreated;
  final String intro;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
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
            Row(
              children: [
                Text(
                  timeCreated['date']!,
                  style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
                const VerticalDivider(
                  thickness: 10,
                  color: Colors.black,
                  width: 16,
                ),
                Text(
                  timeCreated['time']!,
                  style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            Text(
              intro,
              style: const TextStyle(fontSize: 14),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const BlogDetails()));
              },
              child: const Text("Read more"),
            )
          ],
        ),
      ),
    );
  }
}
