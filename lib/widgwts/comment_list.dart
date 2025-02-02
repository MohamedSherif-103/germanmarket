import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/user_comment.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const UserComment();
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 6);
  }
}
