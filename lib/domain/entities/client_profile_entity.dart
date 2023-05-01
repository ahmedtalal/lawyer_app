class ClientProfileEntity {
  ClientProfileAttributes? data;

  ClientProfileEntity({this.data});
}

class ClientProfileAttributes {
  int? id;
  String? token;
  String? name;
  String? email;
  String? phoneNumber;
  String? type;
  String? zone;
  String? city;
  String? about;
  int? status;
  String? personalImage;
  String? createdAt;

  ClientProfileAttributes(
      {this.id,
      this.token,
      this.name,
      this.email,
      this.phoneNumber,
      this.type,
      this.zone,
      this.city,
      this.about,
      this.status,
      this.personalImage,
      this.createdAt});

  ClientProfileAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    zone = json['zone'];
    city = json['city'];
    about = json['about'];
    status = json['status'];
    personalImage = json['personal_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    data['zone'] = this.zone;
    data['city'] = this.city;
    data['about'] = this.about;
    data['status'] = this.status;
    data['personal_image'] = this.personalImage;
    data['created_at'] = this.createdAt;
    return data;
  }
}
