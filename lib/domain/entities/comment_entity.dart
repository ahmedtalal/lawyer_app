class CommentEntity {
  List<CommentData>? data;
  CommentEntity({this.data});
}

class CommentData {
  int? id;
  String? type;
  String? description;
  CommentFromUser? fromUser;

  CommentData({this.id, this.type, this.description, this.fromUser});

  CommentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    fromUser = json['from_user'] != null
        ? new CommentFromUser.fromJson(json['from_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    if (this.fromUser != null) {
      data['from_user'] = this.fromUser!.toJson();
    }
    return data;
  }
}

class CommentFromUser {
  int? id;
  String? name;
  String? personalImage;

  CommentFromUser({this.id, this.name, this.personalImage});

  CommentFromUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    personalImage = json['personal_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['personal_image'] = this.personalImage;
    return data;
  }
}
