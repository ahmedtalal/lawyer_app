import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';

class RequestsOrderForLawyerModel extends RequestsOrderForLawyerEntity {
  RequestsOrderForLawyerModel({super.data});
  RequestsOrderForLawyerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RequestsOrderInfo>[];
      json['data'].forEach((v) {
        data!.add(new RequestsOrderInfo.fromJson(v));
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
