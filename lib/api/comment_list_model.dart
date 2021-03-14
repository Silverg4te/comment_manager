class CommentListModel {
  List<CommentModel> _list = [];

  List<CommentModel> get list => _list;

  CommentListModel();

  CommentListModel.fromResponseObject(dynamic o) {
    var tempComments = o;
    if (tempComments != null) {
      List<CommentModel> comments = [];
      tempComments
          .forEach((comment) => comments.add(CommentModel.fromObject(comment)));
      this._list = comments;
    }
  }
}

class CommentModel {
  int _postId;
  int _id;
  String _name;
  String _email;
  String _body;

  int get postId => _postId;

  int get id => _id;

  String get name => _name;

  String get email => _email;

  String get body => _body;

  CommentModel.fromObject(dynamic o) {
    this._postId = o['userId'];
    this._id = o['id'];
    this._name = o['name'];
    this._email = o['email'];
    this._body = o['body'];
  }
}
