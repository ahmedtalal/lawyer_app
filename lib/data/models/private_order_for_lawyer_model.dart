import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';

class PrivateOrdersForLawyerModel extends PrivateOrdersForLawyerEntity {
  PrivateOrdersForLawyerModel({super.data});

  PrivateOrdersForLawyerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PrivateOrdersInfoModel>[];
      json['data'].forEach((v) {
        data!.add(PrivateOrdersInfoModel.fromJson(v));
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
