import 'package:hokok/domain/entities/feedback_entity.dart';

class FeedBackModel extends FeedBackEntity {
  FeedBackModel({super.data});

  FeedBackModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FeedBackData>[];
      json['data'].forEach((v) {
        data!.add(new FeedBackData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeedBackData {
  int? id;
  int? rate;
  FromUser? fromUser;
  String? feedback;

  FeedBackData({this.id, this.rate, this.fromUser, this.feedback});

  FeedBackData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    fromUser = json['from_user'] != null
        ? new FromUser.fromJson(json['from_user'])
        : null;
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    if (this.fromUser != null) {
      data['from_user'] = this.fromUser!.toJson();
    }
    data['feedback'] = this.feedback;
    return data;
  }
}

class FromUser {
  String? id;
  String? name;
  String? personalImage;

  FromUser({this.id, this.name, this.personalImage});

  FromUser.fromJson(Map<String, dynamic> json) {
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
