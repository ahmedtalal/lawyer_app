import '../../domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity{
  FavoriteModel({super.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteInfoModel>[];
      json['data'].forEach((v) {
        data!.add( FavoriteInfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteInfoModel {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? personalImage;

  FavoriteInfoModel({this.id, this.userId, this.name, this.type, this.personalImage});

  FavoriteInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    personalImage = json['personal_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['personal_image'] = this.personalImage;
    return data;
  }
}