import 'package:hokok/domain/entities/lawyer_entity.dart';

class LawyerModel extends LawyerEntity {
  LawyerModel({super.data});

  LawyerModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LawyerInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
