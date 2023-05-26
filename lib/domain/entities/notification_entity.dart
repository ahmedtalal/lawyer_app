class NotificationEntity {
  NotificationInfoModel? data;

  NotificationEntity({this.data});
}

class NotificationInfoModel {
  List<NotificationsInfo>? notifications;
  NotificationPagination? pagination;

  NotificationInfoModel({this.notifications, this.pagination});

  NotificationInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <NotificationsInfo>[];
      json['notifications'].forEach((v) {
        notifications!.add(new NotificationsInfo.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new NotificationPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class NotificationsInfo {
  int? id;
  NotificationForm? from;
  String? notifiableType;
  int? notifiableId;
  String? content;
  int? read;
  String? createdAt;

  NotificationsInfo(
      {this.id,
      this.from,
      this.notifiableType,
      this.notifiableId,
      this.content,
      this.read,
      this.createdAt});

  NotificationsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'] != null
        ? new NotificationForm.fromJson(json['from'])
        : null;
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    content = json['content'];
    read = json['read'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    data['notifiable_type'] = this.notifiableType;
    data['notifiable_id'] = this.notifiableId;
    data['content'] = this.content;
    data['read'] = this.read;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class NotificationForm {
  int? id;
  String? name;
  String? type;
  String? personalImage;

  NotificationForm({this.id, this.name, this.type, this.personalImage});

  NotificationForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    personalImage = json['personal_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['personal_image'] = this.personalImage;
    return data;
  }
}

class NotificationPagination {
  dynamic? total;
  dynamic? count;
  dynamic? perPage;
  dynamic? currentPage;
  dynamic? totalPages;
  NotificationLinks? links;

  NotificationPagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages,
      this.links});

  NotificationPagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    links = json['links'] != null
        ? new NotificationLinks.fromJson(json['links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class NotificationLinks {
  Null? previous;
  String? next;

  NotificationLinks({this.previous, this.next});

  NotificationLinks.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previous'] = this.previous;
    data['next'] = this.next;
    return data;
  }
}
