class UserEntity {
  String? type, name, email, phoneNumber, zone, city;
  List<dynamic>? majors;
  UserEntity({
    this.type,
    this.name,
    this.email,
    this.phoneNumber,
    this.zone,
    this.city,
    this.majors,
  });
}
