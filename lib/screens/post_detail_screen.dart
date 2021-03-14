import 'dart:ui';

import 'package:comment_manager/api/comment_list_model.dart';
import 'package:comment_manager/api/post_list_model.dart';
import 'package:comment_manager/service/apiClient.dart';
import 'package:comment_manager/widgets/comment_item.dart';
import 'package:comment_manager/widgets/listIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostDetailScreen extends StatefulWidget {
  PostDetailScreen({this.id});

  final int id;

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  String title;
  String body;
  List<CommentModel> list;
  List<CommentModel> _filteredList;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    getPostData(widget.id);
    getCommentsData(widget.id);
  }

  void getPostData(id) async {
    PostModel post = await getPost(id);
    setState(() {
      title = post.title;
      body = post.body;
    });
  }

  void getCommentsData(id) async {
    CommentListModel commentsModel = await getComments(id);
    setState(() {
      list = commentsModel.list;
      _filteredList = commentsModel.list;
    });
  }

  void filterComments(value) {
    print(value);
    setState(() {
      _filteredList = list.where((comments) =>
          (comments.name.toLowerCase().contains(value.toLowerCase()) ||
              comments.body.toLowerCase().contains(value.toLowerCase()) ||
              comments.email.toLowerCase().contains(value.toLowerCase()))).toList();
    });
  }

  List<Widget> showPostDetails(){
    if(isSearching) return [SizedBox()];
    if(title == null) return [Center(
      child: SpinKitWave(
        color: Colors.blue,
        size: 100.0,
      ),
    )];


    return [
      Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: ListIcon(size: 100),
      ),
      Text(
        title ?? "",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      SizedBox(height: 5),
      Text(body ?? ""),
      SizedBox(height: 20),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: !isSearching
            ? Text("Details")
            : TextField(
                onChanged: (value) {
                  filterComments(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Search Comments",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: [
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      _filteredList = list;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...showPostDetails(),
              _filteredList != null
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CommentItem(comment: _filteredList[index]);
                        },
                        itemCount: _filteredList.length,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
