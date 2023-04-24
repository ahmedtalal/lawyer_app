import 'package:hokok/domain/entities/certification_entity.dart';

class CertificationModel extends CertificationEntity{
  CertificationModel({super.data});

  CertificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CertificationInfoModel>[];
      json['data'].forEach((v) {
        data!.add( CertificationInfoModel.fromJson(v));
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

class CertificationInfoModel {
  int? id;
  String? certificateImg;
  String? createdAt;

  CertificationInfoModel({this.id, this.certificateImg, this.createdAt});

  CertificationInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    certificateImg = json['certificate_img'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['certificate_img'] = certificateImg;
    data['created_at'] = createdAt;
    return data;
  }
}