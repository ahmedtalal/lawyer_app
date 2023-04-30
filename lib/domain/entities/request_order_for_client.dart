class RequestsOrderForClientEntity {
  List<RequestsClientOrderInfo>? data;

  RequestsOrderForClientEntity({this.data});
}

class RequestsClientOrderInfo {
  int? id;
  dynamic expectedDays;
  bool? available;
  dynamic expectedBudget;
  String? info;
  int? status;
  List<String>? files;
  String? createdAt;
  Lawyer? lawyer;

  RequestsClientOrderInfo(
      {this.id,
        this.expectedDays,
        this.available,
        this.expectedBudget,
        this.status,
        this.info,
        this.files,
        this.createdAt,
        this.lawyer});

  RequestsClientOrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expectedDays = json['expected_days'];
    expectedBudget = json['expected_budget'];
    available= json['available'];
    info = json['info'];
    status = json['status'];
    files = json['files'].cast<String>();
    createdAt = json['created_at'];
    lawyer =
    json['order'] != null ?  Lawyer.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['expected_days'] = expectedDays;
    data['expected_budget'] = expectedBudget;
    data['status'] = status;
    data['info'] = info;
    data['files'] = files;
    data['created_at'] = createdAt;
    if (lawyer != null) {
      data['order'] = lawyer!.toJson();
    }
    return data;
  }
}

class Lawyer {
  int? id;
  String? name;
  String? personalImage;


  Lawyer(
      {this.id,
        this.name,
        this.personalImage,
       });

  Lawyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    personalImage = json['personal_image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name']  =name;
    data['personal_image'] ==personalImage;

    return data;
  }
}
