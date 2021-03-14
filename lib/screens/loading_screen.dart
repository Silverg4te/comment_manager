import 'package:comment_manager/api/post_list_model.dart';
import 'package:comment_manager/screens/post_screen.dart';
import 'package:comment_manager/service/apiClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  void getPostsData() async {
    PostListModel model = await getPosts();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return PostScreen(
        posts: model
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
