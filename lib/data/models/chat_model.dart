import 'package:hokok/domain/entities/chat_entity.dart';

class ChatsModel extends ChatEntity {
  ChatsModel({super.data});

  ChatsModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new ChatInfoModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChatInfoModel {
  List<Chats>? chats;
  Pagination? pagination;

  ChatInfoModel({this.chats, this.pagination});

  ChatInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(new Chats.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chats != null) {
      data['chats'] = this.chats!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Chats {
  int? id;
  String? name;
  String? type;
  int? receiverId;
  LastMessage? lastMessage;

  Chats({this.id, this.name, this.type, this.receiverId, this.lastMessage});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    receiverId = json['receiver_id'];
    lastMessage = json['last_message'] != null
        ? new LastMessage.fromJson(json['last_message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['receiver_id'] = this.receiverId;
    if (this.lastMessage != null) {
      data['last_message'] = this.lastMessage!.toJson();
    }
    return data;
  }
}

class LastMessage {
  int? id;
  Sender? sender;
  String? direction;
  String? content;
  int? chatId;
  String? createdAt;

  LastMessage(
      {this.id,
      this.sender,
      this.direction,
      this.content,
      this.chatId,
      this.createdAt});

  LastMessage.fromJson(Map<String, dynamic> json) {
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
  ChatLinks? links;

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
    links =
        json['links'] != null ? new ChatLinks.fromJson(json['links']) : null;
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

class ChatLinks {
  Null? previous;
  Null? next;

  ChatLinks({this.previous, this.next});

  ChatLinks.fromJson(Map<String, dynamic> json) {
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
