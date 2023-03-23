import 'package:hokok/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({super.userModel});

  UserModel.fromJson(Map<String, dynamic> json) {
    userModel = json['data'] != null
        ? UserModelInfo.lawyerFromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userModel != null) {
      data['data'] = this.userModel!.lawyerToJson();
    }
    return data;
  }
}

class UserModelInfo {
  int? id;
  String? token;
  String? name;
  String? email;
  String? phoneNumber;
  String? type;
  String? zone;
  String? city;
  String? about;
  int? status;
  String? personalImage;
  String? createdAt;
  int? lawyerId;
  String? licenseImg;
  int? idNumber;
  String? idExpiryDate;
  List<UserMajors>? majors;

  UserModelInfo({
    this.id,
    this.token,
    this.name,
    this.email,
    this.phoneNumber,
    this.type,
    this.zone,
    this.city,
    this.about,
    this.status,
    this.personalImage,
    this.createdAt,
    this.lawyerId,
    this.licenseImg,
    this.idNumber,
    this.idExpiryDate,
    this.majors,
  });

  UserModelInfo.lawyerFromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    zone = json['zone'];
    city = json['city'];
    about = json['about'];
    status = json['status'];
    personalImage = json['personal_image'];
    createdAt = json['created_at'];
    lawyerId = json['lawyer_id'];
    licenseImg = json['license_img'];
    idNumber = json['id_number'];
    idExpiryDate = json['id_expiry_date'];
    if (json['majors'] != null) {
      majors = <UserMajors>[];
      json['majors'].forEach((v) {
        majors!.add(new UserMajors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> lawyerToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    data['zone'] = this.zone;
    data['city'] = this.city;
    data['about'] = this.about;
    data['status'] = this.status;
    data['personal_image'] = this.personalImage;
    data['created_at'] = this.createdAt;
    data['lawyer_id'] = this.lawyerId;
    data['license_img'] = this.licenseImg;
    data['id_number'] = this.idNumber;
    data['id_expiry_date'] = this.idExpiryDate;
    if (this.majors != null) {
      data['majors'] = this.majors!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  UserModelInfo.clientFromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    zone = json['zone'];
    city = json['city'];
    about = json['about'];
    status = json['status'];
    personalImage = json['personal_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> clientToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    data['zone'] = this.zone;
    data['city'] = this.city;
    data['about'] = this.about;
    data['status'] = this.status;
    data['personal_image'] = this.personalImage;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class UserMajors {
  int? id;
  String? name;
  String? icon;

  UserMajors({this.id, this.name, this.icon});

  UserMajors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
