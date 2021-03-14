import 'package:comment_manager/api/comment_list_model.dart';
import 'package:flutter/material.dart';

import 'listIcon.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;

  CommentItem({this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          "${comment.name}(${comment.email})",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        subtitle: Text(comment.body, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
        leading: ListIcon(size: 30));
  }
}
