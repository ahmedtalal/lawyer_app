class MajorEntity {
  List<MajorData>? data;

  MajorEntity({this.data});
}

class MajorData {
  int? id;
  String? name;
  String? icon;

  MajorData({this.id, this.name, this.icon});

  MajorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
