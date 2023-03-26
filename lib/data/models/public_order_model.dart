import 'package:hokok/domain/entities/public_order_entity.dart';

class PublicOrderModel extends PublicOrderEntity {
  PublicOrderModel({super.data});

  PublicOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderInfoModel>[];
      json['data'].forEach((v) {
        data!.add(new OrderInfoModel.fromJson(v));
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
