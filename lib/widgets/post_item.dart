import 'package:comment_manager/api/post_list_model.dart';
import 'package:flutter/material.dart';

import 'listIcon.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final Function onTap;

  PostItem({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          onTap(post.id);
        },
        contentPadding: EdgeInsets.all(15),
        leading: ListIcon(size: 50),
        title: Text(post.title,
            maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          post.body,
          maxLines: 3,
        ),
      ),
    );
  }
}
