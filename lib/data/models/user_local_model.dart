class UserLocalModel {
  UserData? data;

  UserLocalModel({this.data});

  UserLocalModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? token;
  String? userType;

  UserData({
    this.id,
    this.token,
    this.userType,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    userType = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['token'] = token;
    data["type"] = userType;
    return data;
  }
}
