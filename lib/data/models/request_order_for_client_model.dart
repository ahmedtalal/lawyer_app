import 'package:hokok/domain/entities/request_order_for_client.dart';

class RequestsOrderForClientModel extends RequestsOrderForClientEntity {
  RequestsOrderForClientModel({super.data});
  RequestsOrderForClientModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RequestsClientOrderInfo>[];
      json['data'].forEach((v) {
        data!.add(new RequestsClientOrderInfo.fromJson(v));
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
