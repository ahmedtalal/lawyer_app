class OrderForClientEntity {
  List<ClientOrderInfo>? data;

  OrderForClientEntity({this.data});
}

class ClientOrderInfo {
  int? id;
  String? title;
  String? description;
  String? major;
  String? subMajor;
  String? status;
  int? statusCode;
  String? type;
  String? clientExpectedDate;
  Null? lawyerExpectedDays;
  double? clientProposedBudget;
  Null? lawyerProposedBudget;
  Null? assignedToLawyerAt;
  Null? deliveredAt;
  Null? lastBudget;
  int? requests;
  String? clientFeedback;
  int? clientFeedbackRate;
  String? lawyerFeedback;
  int? lawyerFeedbackRate;
  Null? cancellationReason;
  String? createdAt;
  Client? client;
  Lawyer? lawyer;

  ClientOrderInfo(
      {this.id,
      this.title,
      this.description,
      this.major,
      this.subMajor,
      this.status,
      this.statusCode,
      this.type,
      this.clientExpectedDate,
      this.lawyerExpectedDays,
      this.clientProposedBudget,
      this.lawyerProposedBudget,
      this.assignedToLawyerAt,
      this.deliveredAt,
      this.lastBudget,
      this.requests,
      this.clientFeedback,
      this.clientFeedbackRate,
      this.lawyerFeedback,
      this.lawyerFeedbackRate,
      this.cancellationReason,
      this.createdAt,
      this.client,
      this.lawyer});

  ClientOrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    major = json['major'];
    subMajor = json['sub_major'];
    status = json['status'];
    statusCode = json['status_code'];
    type = json['type'];
    clientExpectedDate = json['client_expected_date'];
    lawyerExpectedDays = json['lawyer_expected_days'];
    clientProposedBudget = json['client_proposed_budget'];
    lawyerProposedBudget = json['lawyer_proposed_budget'];
    assignedToLawyerAt = json['assigned_to_lawyer_at'];
    deliveredAt = json['delivered_at'];
    lastBudget = json['last_budget'];
    requests = json['requests'];
    clientFeedback = json['client_feedback'];
    clientFeedbackRate = json['client_feedback_rate'];
    lawyerFeedback = json['lawyer_feedback'];
    lawyerFeedbackRate = json['lawyer_feedback_rate'];
    cancellationReason = json['cancellation_reason'];
    createdAt = json['created_at'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    lawyer =
        json['lawyer'] != null ? new Lawyer.fromJson(json['lawyer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['major'] = this.major;
    data['sub_major'] = this.subMajor;
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['type'] = this.type;
    data['client_expected_date'] = this.clientExpectedDate;
    data['lawyer_expected_days'] = this.lawyerExpectedDays;
    data['client_proposed_budget'] = this.clientProposedBudget;
    data['lawyer_proposed_budget'] = this.lawyerProposedBudget;
    data['assigned_to_lawyer_at'] = this.assignedToLawyerAt;
    data['delivered_at'] = this.deliveredAt;
    data['last_budget'] = this.lastBudget;
    data['requests'] = this.requests;
    data['client_feedback'] = this.clientFeedback;
    data['client_feedback_rate'] = this.clientFeedbackRate;
    data['lawyer_feedback'] = this.lawyerFeedback;
    data['lawyer_feedback_rate'] = this.lawyerFeedbackRate;
    data['cancellation_reason'] = this.cancellationReason;
    data['created_at'] = this.createdAt;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.lawyer != null) {
      data['lawyer'] = this.lawyer!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? personalImage;

  Client({this.id, this.name, this.personalImage});

  Client.fromJson(Map<String, dynamic> json) {
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

class Lawyer {
  int? id;
  String? name;
  String? personalImage;

  Lawyer({this.id, this.name, this.personalImage});

  Lawyer.fromJson(Map<String, dynamic> json) {
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
