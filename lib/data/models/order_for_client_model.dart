import 'package:hokok/domain/entities/order_for_client_entity.dart';

class OrderForClientModel extends OrderForClientEntity {
  OrderForClientModel({super.data});

  OrderForClientModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClientOrderInfo>[];
      json['data'].forEach((v) {
        data!.add(new ClientOrderInfo.fromJson(v));
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
