import 'package:hokok/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({super.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransactionInfoModel>[];
      json['data'].forEach((v) {
        data!.add(TransactionInfoModel.fromJson(v));
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
