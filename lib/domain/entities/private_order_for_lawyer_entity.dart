import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';

class PrivateOrdersForLawyerEntity {
  List<PrivateOrdersInfoModel>? data;

  PrivateOrdersForLawyerEntity({this.data});
}

class PrivateOrdersInfoModel {
  int? id;
  String? title;
  String? description;
  String? major;
  int? requests;
  String? city;
  bool? canRequest;
  String? createdAt;
  Client? client;
  List<ClientFeedback>? clientFeedback;

  PrivateOrdersInfoModel(
      {this.id,
      this.title,
      this.description,
      this.major,
      this.requests,
      this.city,
      this.canRequest,
      this.createdAt,
      this.client,
      this.clientFeedback});

  PrivateOrdersInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    major = json['major'];
    requests = json['requests'];
    city = json['city'];
    canRequest = json['can_request'];
    createdAt = json['created_at'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    if (json['client_feedback'] != null) {
      clientFeedback = <ClientFeedback>[];
      json['client_feedback'].forEach((v) {
        clientFeedback!.add(new ClientFeedback.fromJson(v));
      });
    }
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
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.clientFeedback != null) {
      data['client_feedback'] =
          this.clientFeedback!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientFeedback {
  int? id;
  int? rate;
  FromUser? fromUser;
  String? feedback;

  ClientFeedback({this.id, this.rate, this.fromUser, this.feedback});

  ClientFeedback.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    fromUser = json['from_user'] != null
        ? new FromUser.fromJson(json['from_user'])
        : null;
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    if (this.fromUser != null) {
      data['from_user'] = this.fromUser!.toJson();
    }
    data['feedback'] = this.feedback;
    return data;
  }
}

class FromUser {
  int? id;
  String? name;
  String? personalImage;

  FromUser({this.id, this.name, this.personalImage});

  FromUser.fromJson(Map<String, dynamic> json) {
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
