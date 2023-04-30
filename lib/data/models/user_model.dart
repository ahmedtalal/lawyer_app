import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hokok/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({super.userModel});

  UserModel.lawyerFromJson(Map<String, dynamic> json) {
    userModel = json['data'] != null
        ? UserModelInfo.lawyerFromJson(json['data'])
        : null;
  }

  UserModel.clientFromJson(Map<String, dynamic> json) {
    userModel = json['data'] != null
        ? UserModelInfo.clientFromJson(json['data'])
        : null;
  }

  Map<String, dynamic> lawyerToJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (userModel != null) {
      data['data'] = userModel!.lawyerToJson();
    }
    return data;
  }

  FormData lawyerToFormData() {
    FormData data = FormData();
    if (userModel != null) {
      data = userModel!.lawyerToFormData();
    }
    return data;
  }

  Map<String, dynamic> clientToJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (userModel != null) {
      data['data'] = userModel!.clientToJson();
    }
    return data;
  }

  FormData clientToFormData() {
    FormData data = FormData();
    if (userModel != null) {
      data = userModel!.clientToFormData();
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
  File? personalImage;
  String? createdAt;
  int? lawyerId;
  File? licenseImg;
  int? idNumber;
  String? idExpiryDate;
  List<int>? majors;

  UserModelInfo({
    id,
    token,
    name,
    email,
    phoneNumber,
    type,
    zone,
    city,
    about,
    status,
    personalImage,
    createdAt,
    lawyerId,
    licenseImg,
    idNumber,
    idExpiryDate,
    majors,
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
    majors:
    json['majors'];
  }

  Map<String, dynamic> lawyerToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['type'] = type;
    data['zone'] = zone;
    data['city'] = city;
    data['about'] = about;
    data['status'] = status;
    data['personal_image'] = personalImage;
    data['created_at'] = createdAt;
    data['lawyer_id'] = lawyerId;
    data['license_img'] = licenseImg;
    data['id_number'] = idNumber;
    data['id_expiry_date'] = idExpiryDate;
    data["majors"] = majors;
    return data;
  }

  FormData lawyerToFormData() {
    FormData formData = FormData.fromMap({
      'id': id,
      'token': token,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'type': type,
      'zone': zone,
      'city': city,
      'about': about,
      'status': status,
      'personal_image': personalImage,
      'created_at': createdAt,
      'lawyer_id': lawyerId,
      'license_img': licenseImg,
      'id_number': idNumber,
      'id_expiry_date': idExpiryDate,
      "majors": majors,
    });
    return formData;
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
    data['id'] = id;
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['type'] = type;
    data['zone'] = zone;
    data['city'] = city;
    data['about'] = about;
    data['status'] = status;
    data['personal_image'] = personalImage;
    data['created_at'] = createdAt;
    return data;
  }

  FormData clientToFormData() {
    FormData formData = FormData.fromMap({
      'id': id,
      'token': token,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'type': type,
      'zone': zone,
      'city': city,
      'about': about,
      'status': status,
      'personal_image': personalImage,
      'created_at': createdAt,
    });
    return formData;
  }
}

class UserMajors {
  int? id;
  String? name;
  String? icon;

  UserMajors({id, name, icon});

  UserMajors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}
