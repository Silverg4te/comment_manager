class PostListModel {
  List<PostModel> _list;

  List<PostModel> get list => _list;

  PostListModel();

  setObject(dynamic o) {
    var tempPosts = o;
    if(tempPosts != null){
      List<PostModel> posts = [];
      var count = tempPosts.length;
      for(int i = 0; i < count; i++){
        posts.add(PostModel.fromObject(tempPosts[i]));
      }
      _list = posts;
    }
  }

  PostListModel.fromResponseObject(dynamic o){
    var tempPosts = o;
    if(tempPosts != null){
      List<PostModel> posts = [];
      var count = tempPosts.length;
      for(int i = 0; i < count; i++){
        posts.add(PostModel.fromObject(tempPosts[i]));
      }
      this._list = posts;
    }
  }
}


class PostModel {
  int _userId;
  int _id;
  String _title;
  String _body;

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  String get body => _body;

  PostModel.fromObject(dynamic o){
    this._userId = o['userId'];
    this._id = o['id'];
    this._body = o['body'];
    this._title = o['title'];
  }
}
