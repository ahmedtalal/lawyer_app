class LawyerEntity {
  LawyerInfoData? data;

  LawyerEntity({this.data});
}

class LawyerInfoData {
  List<LawyerAttributes>? lawyers;
  Pagination? pagination;

  LawyerInfoData({this.lawyers, this.pagination});

  LawyerInfoData.fromJson(Map<String, dynamic> json) {
    if (json['lawyers'] != null) {
      lawyers = <LawyerAttributes>[];
      json['lawyers'].forEach((v) {
        lawyers!.add(new LawyerAttributes.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lawyers != null) {
      data['lawyers'] = this.lawyers!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class LawyerAttributes {
  int? id;
  String? name;
  String? city;
  String? zone;
  String? about;
  int? averageFees;
  int? legalAdvice;
  int? completedOrders;
  int? pendingOrders;
  String? personalImage;
  String? createdAt;
  List<Certifications>? certifications;
  List<Feedbacks>? feedbacks;
  double? lawyerRate;
  int? ratesNum;
  bool? canChat;

  LawyerAttributes(
      {this.id,
      this.name,
      this.city,
      this.zone,
      this.about,
      this.averageFees,
      this.legalAdvice,
      this.completedOrders,
      this.pendingOrders,
      this.personalImage,
      this.createdAt,
      this.certifications,
      this.feedbacks,
      this.lawyerRate,
      this.ratesNum,
      this.canChat});

  LawyerAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    zone = json['zone'];
    about = json['about'];
    averageFees = json['average_fees'];
    legalAdvice = json['legal_advice'];
    completedOrders = json['completed_orders'];
    pendingOrders = json['pending_orders'];
    personalImage = json['personal_image'];
    createdAt = json['created_at'];
    if (json['certifications'] != null) {
      certifications = <Certifications>[];
      json['certifications'].forEach((v) {
        certifications!.add(new Certifications.fromJson(v));
      });
    }
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(new Feedbacks.fromJson(v));
      });
    }
    lawyerRate = json['lawyer_rate'];
    ratesNum = json['rates_num'];
    canChat = json['can_chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['zone'] = this.zone;
    data['about'] = this.about;
    data['average_fees'] = this.averageFees;
    data['legal_advice'] = this.legalAdvice;
    data['completed_orders'] = this.completedOrders;
    data['pending_orders'] = this.pendingOrders;
    data['personal_image'] = this.personalImage;
    data['created_at'] = this.createdAt;
    if (this.certifications != null) {
      data['certifications'] =
          this.certifications!.map((v) => v.toJson()).toList();
    }
    if (this.feedbacks != null) {
      data['feedbacks'] = this.feedbacks!.map((v) => v.toJson()).toList();
    }
    data['lawyer_rate'] = this.lawyerRate;
    data['rates_num'] = this.ratesNum;
    data['can_chat'] = this.canChat;
    return data;
  }
}

class Certifications {
  int? id;
  String? certificateImg;
  String? createdAt;

  Certifications({this.id, this.certificateImg, this.createdAt});

  Certifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    certificateImg = json['certificate_img'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['certificate_img'] = this.certificateImg;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Feedbacks {
  String? feedback;
  int? rate;

  Feedbacks({this.feedback, this.rate});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    feedback = json['feedback'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feedback'] = this.feedback;
    data['rate'] = this.rate;
    return data;
  }
}

class Pagination {
  int? total;
  int? count;
  String? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages,
      this.links});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
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

class Links {
  Null? previous;
  Null? next;

  Links({this.previous, this.next});

  Links.fromJson(Map<String, dynamic> json) {
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
