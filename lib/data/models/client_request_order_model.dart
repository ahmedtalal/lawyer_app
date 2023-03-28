import 'package:hokok/domain/entities/client__requests_order_entity.dart';

class CLientRequestOrderModel extends ClientOrderRequestEntity {
  CLientRequestOrderModel({super.data});

  CLientRequestOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RequestOrderInfo>[];
      json['data'].forEach((v) {
        data!.add(new RequestOrderInfo.fromJson(v));
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
