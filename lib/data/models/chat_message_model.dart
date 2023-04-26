import 'package:hokok/domain/entities/chat_message_entity.dart';

class ChatMessageModel extends ChatMessageEntity {
  ChatMessageModel({super.data});

  ChatMessageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ChatMessageInfoModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChatMessageInfoModel {
  List<ChatMessages>? messages;
  Pagination? pagination;

  ChatMessageInfoModel({this.messages, this.pagination});

  ChatMessageInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <ChatMessages>[];
      json['messages'].forEach((v) {
        messages!.add(new ChatMessages.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class ChatMessages {
  int? id;
  Sender? sender;
  String? direction;
  String? content;
  int? chatId;
  String? createdAt;

  ChatMessages(
      {this.id,
      this.sender,
      this.direction,
      this.content,
      this.chatId,
      this.createdAt});

  ChatMessages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    direction = json['direction'];
    content = json['content'];
    chatId = json['chat_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['direction'] = this.direction;
    data['content'] = this.content;
    data['chat_id'] = this.chatId;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Sender {
  int? id;
  String? name;
  String? personalImage;

  Sender({this.id, this.name, this.personalImage});

  Sender.fromJson(Map<String, dynamic> json) {
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

class Pagination {
  int? total;
  int? count;
  int? perPage;
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
