class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});

  PostsModel.fromJson(Map<dynamic, dynamic> json) {
    this.userId = json["userId"];
    this.id = json["id"];
    this.title = json["title"];
    this.body = json["body"];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["id"] = this.id;
    data["title"] = this.title;
    data["body"] = this.body;
    return data;
  }
}
