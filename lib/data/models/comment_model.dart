import 'package:hokok/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({super.data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CommentData>[];
      json['data'].forEach((v) {
        data!.add(new CommentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
