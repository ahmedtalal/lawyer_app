import 'package:hokok/domain/entities/wallet_entity.dart';

class WalletModel extends WalletEntity {
  WalletModel({super.data});

  WalletModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new WalletInfoModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
