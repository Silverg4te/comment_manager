import 'package:comment_manager/widgets/post_item.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  PostList({this.posts, this.onTap});

  final Function onTap;
  final List<dynamic> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return PostItem(
              post: posts[index],
              onTap:onTap,
            );
          },
          itemCount: posts.length),
    );
  }
}
