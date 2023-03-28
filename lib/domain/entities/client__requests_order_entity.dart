class ClientOrderRequestEntity {
  List<RequestOrderInfo>? data;

  ClientOrderRequestEntity({this.data});
}

class RequestOrderInfo {
  int? id;
  LawyerInfo? lawyer;
  int? expectedDays;
  bool? available;
  double? expectedBudget;
  String? info;
  List<String>? files;
  String? createdAt;

  RequestOrderInfo(
      {this.id,
      this.lawyer,
      this.expectedDays,
      this.available,
      this.expectedBudget,
      this.info,
      this.files,
      this.createdAt});

  RequestOrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lawyer =
        json['lawyer'] != null ? new LawyerInfo.fromJson(json['lawyer']) : null;
    expectedDays = json['expected_days'];
    available = json['available'];
    expectedBudget = json['expected_budget'];
    info = json['info'];
    files = json['files'].cast<String>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.lawyer != null) {
      data['lawyer'] = this.lawyer!.toJson();
    }
    data['expected_days'] = this.expectedDays;
    data['available'] = this.available;
    data['expected_budget'] = this.expectedBudget;
    data['info'] = this.info;
    data['files'] = this.files;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class LawyerInfo {
  int? id;
  String? name;
  String? personalImage;

  LawyerInfo({this.id, this.name, this.personalImage});

  LawyerInfo.fromJson(Map<String, dynamic> json) {
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
