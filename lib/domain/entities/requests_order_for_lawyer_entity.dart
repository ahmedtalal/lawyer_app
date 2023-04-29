class RequestsOrderForLawyerEntity {
  List<RequestsLawyerOrderInfo>? data;

  RequestsOrderForLawyerEntity({this.data});
}

class RequestsLawyerOrderInfo {
  int? id;
  dynamic expectedDays;
  dynamic expectedBudget;
  int? status;
  String? info;
  List<String>? files;
  String? createdAt;
  RequestOrder? order;

  RequestsLawyerOrderInfo(
      {this.id,
      this.expectedDays,
      this.expectedBudget,
      this.status,
      this.info,
      this.files,
      this.createdAt,
      this.order});

  RequestsLawyerOrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expectedDays = json['expected_days'];
    expectedBudget = json['expected_budget'];
    info = json['info'];
    status = json['status'];
    files = json['files'].cast<String>();
    createdAt = json['created_at'];
    order =
        json['order'] != null ? new RequestOrder.fromJson(json['order']) : null;
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
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class RequestOrder {
  int? id;
  String? title;
  String? description;
  int? requests;
  String? city;
  bool? canRequest;
  String? createdAt;

  RequestOrder(
      {this.id,
      this.title,
      this.description,
      this.requests,
      this.city,
      this.canRequest,
      this.createdAt});

  RequestOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    requests = json['requests'];
    city = json['city'];
    canRequest = json['can_request'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['requests'] = this.requests;
    data['city'] = this.city;
    data['can_request'] = this.canRequest;
    data['created_at'] = this.createdAt;
    return data;
  }
}
