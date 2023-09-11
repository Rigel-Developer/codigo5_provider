
class JsonPlaceHolderModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  JsonPlaceHolderModel({this.userId, this.id, this.title, this.completed});

  JsonPlaceHolderModel.fromJson(Map<String, dynamic> json) {
    if(json["userId"] is int) {
      userId = json["userId"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["completed"] is bool) {
      completed = json["completed"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["id"] = id;
    _data["title"] = title;
    _data["completed"] = completed;
    return _data;
  }
}