class TransactionEntity {
  List<TransactionInfoModel>? data;

  TransactionEntity({this.data});
}

class TransactionInfoModel {
  int? id;
  To? to;
  TransactionOrderInfoModel? order;
  double? amount;
  String? doneAt;
  String? status;
  String? createdAt;

  TransactionInfoModel(
      {this.id,
      this.to,
      this.order,
      this.amount,
      this.doneAt,
      this.status,
      this.createdAt});

  TransactionInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    to = json['to'] != null ? new To.fromJson(json['to']) : null;
    order = json['order'] != null
        ? new TransactionOrderInfoModel.fromJson(json['order'])
        : null;
    amount = json['amount'];
    doneAt = json['done_at'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.to != null) {
      data['to'] = this.to!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['amount'] = this.amount;
    data['done_at'] = this.doneAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class To {
  int? id;
  String? name;
  String? personalImage;

  To({this.id, this.name, this.personalImage});

  To.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    personalImage = json['personal_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['personal_image'] = this.personalImage;
    return data;
  }
}

class TransactionOrderInfoModel {
  int? id;
  String? title;
  String? description;
  String? major;
  String? deliveredAt;
  String? createdAt;

  TransactionOrderInfoModel(
      {this.id,
      this.title,
      this.description,
      this.major,
      this.deliveredAt,
      this.createdAt});

  TransactionOrderInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    major = json['major'];
    deliveredAt = json['delivered_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['major'] = this.major;
    data['delivered_at'] = this.deliveredAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
