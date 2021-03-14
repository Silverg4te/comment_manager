import 'dart:convert';

import 'package:comment_manager/api/comment_list_model.dart';
import 'package:comment_manager/api/post_list_model.dart';
import 'package:http/http.dart' as http;

const baseApi = "jsonplaceholder.typicode.com";

Future<PostListModel> getPosts() async {
  var url = Uri.https(baseApi, '/posts');
  http.Response response = await http.get(url);
  var jsonResponse = jsonDecode(response.body);
  PostListModel posts = PostListModel.fromResponseObject(jsonResponse);
  return posts;
}

Future<PostModel> getPost(id) async {
  var url = Uri.https(baseApi, '/posts/$id');
  var response = await http.get(url);
  var jsonResponse = jsonDecode(response.body);
  PostModel post = PostModel.fromObject(jsonResponse);
  return post;
}

Future<CommentListModel> getComments(id) async {
  var url = Uri.https(baseApi, "/comments", {"postId": id.toString()});
  var response = await http.get(url);
  var jsonResponse = jsonDecode(response.body);
  var comments = CommentListModel.fromResponseObject(jsonResponse);
  return comments;
}
