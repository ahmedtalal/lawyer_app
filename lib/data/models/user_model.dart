import 'package:hokok/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.type,
    super.name,
    super.email,
    super.phoneNumber,
    super.zone,
    super.city,
    super.major,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      type: data["type"],
      name: data["name"],
      email: data["email"],
      phoneNumber: data["phone_number"],
      zone: data["zone"],
      city: data["city"],
      major: data["majors"],
    );
  }

  static Map<String, dynamic> toJson(UserEntity model) {
    return {
      "type": model.type,
      "name": model.name,
      "email": model.email,
      "phone_number": model.phoneNumber,
      "zone": model.zone,
      "city": model.city,
      "majors": model.major,
    };
  }
}
