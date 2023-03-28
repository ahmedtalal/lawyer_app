import 'package:hokok/domain/entities/plans_entity.dart';

class PlansModel extends PlanEntity {
  PlansModel({super.data});

  PlansModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PlansInfoModel>[];
      json['data'].forEach((v) {
        data!.add(new PlansInfoModel.fromJson(v));
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
