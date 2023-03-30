class SubMajorsEntity {
  List<SubMajorsInfoModel>? data;

  SubMajorsEntity({this.data});
}

class SubMajorsInfoModel {
  int? id;
  String? name;

  SubMajorsInfoModel({this.id, this.name});

  SubMajorsInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
