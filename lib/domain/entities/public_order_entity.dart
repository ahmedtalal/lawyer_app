class PublicOrderEntity {
  List<OrderInfoModel>? data;

  PublicOrderEntity({this.data});
}

class OrderInfoModel {
  int? id;
  String? title;
  String? description;
  String? major;
  int? requests;
  String? city;
  bool? canRequest;
  String? createdAt;

  OrderInfoModel(
      {this.id,
      this.title,
      this.description,
      this.major,
      this.requests,
      this.city,
      this.canRequest,
      this.createdAt});

  OrderInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    major = json['major'];
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
    data['major'] = this.major;
    data['requests'] = this.requests;
    data['city'] = this.city;
    data['can_request'] = this.canRequest;
    data['created_at'] = this.createdAt;
    return data;
  }
}
