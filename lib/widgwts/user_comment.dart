import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              "User Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "comments  ",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Reply",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "replies........",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
