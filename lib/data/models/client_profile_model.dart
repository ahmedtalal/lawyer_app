import 'package:hokok/domain/entities/client_profile_entity.dart';

class ClientProfileModel extends ClientProfileEntity {
  ClientProfileModel({super.data});

  ClientProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ClientProfileAttributes.fromJson(json['data'])
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
