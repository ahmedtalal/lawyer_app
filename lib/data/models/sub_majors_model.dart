import 'package:hokok/domain/entities/sub_majors_entity.dart';

class SubMajorsModel extends SubMajorsEntity {
  SubMajorsModel({super.data});

  SubMajorsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SubMajorsInfoModel>[];
      json['data'].forEach((v) {
        data!.add(SubMajorsInfoModel.fromJson(v));
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
