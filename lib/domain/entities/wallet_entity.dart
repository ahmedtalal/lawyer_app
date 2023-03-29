class WalletEntity {
  WalletInfoModel? data;

  WalletEntity({this.data});
}

class WalletInfoModel {
  int? id;
  double? pendingCredits;
  double? withdrawableCredits;
  String? createdAt;

  WalletInfoModel(
      {this.id, this.pendingCredits, this.withdrawableCredits, this.createdAt});

  WalletInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pendingCredits = json['pending_credits'];
    withdrawableCredits = json['withdrawable_credits'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pending_credits'] = this.pendingCredits;
    data['withdrawable_credits'] = this.withdrawableCredits;
    data['created_at'] = this.createdAt;
    return data;
  }
}
