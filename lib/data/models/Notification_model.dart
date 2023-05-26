import 'package:hokok/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({super.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new NotificationInfoModel.fromJson(json['data'])
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
