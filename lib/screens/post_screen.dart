import 'package:comment_manager/api/post_list_model.dart';
import 'package:comment_manager/screens/post_detail_screen.dart';
import 'package:comment_manager/widgets/post_list.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  PostScreen({this.posts});

  final PostListModel posts;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.posts.list);
  }

  void handleTap(id) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostDetailScreen(id: id);
    }));
  }

  void updateUI(dynamic commentsData) {
    setState(() {
      if (commentsData.length <= 0) {
        posts = [];
      } else {
        posts = commentsData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Posts'),
        ),
        body: SafeArea(
      child: Container(
          child: PostList(
        posts: posts,
        onTap: (id) {
          handleTap(id);
        },
      )),
    ));
  }
}
