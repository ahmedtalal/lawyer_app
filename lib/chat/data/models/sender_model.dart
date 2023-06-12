import '../../domain/entities/sender.dart';

class SenderModel extends SenderEntitiy {
  SenderModel({
    required super.userName,
    required super.id,
    required super.avatarUrl,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      userName: json['name'] ?? 0,
      avatarUrl: json["personal_image"] ??
          "https://upload.wikimedia.org/wikipedia/commons/2/2f/No-photo-m.png",
      id: json['id'] ?? 0,
    );
  }
}
