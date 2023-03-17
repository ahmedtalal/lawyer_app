import 'package:hokok/domain/entities/major_entity.dart';

class MajorsModel extends MajorEntity {
  MajorsModel({super.data});
  MajorsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MajorData>[];
      json['data'].forEach((v) {
        this.data!.add(new MajorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
