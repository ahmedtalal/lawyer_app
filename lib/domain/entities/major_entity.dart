class MajorEntity {
  List<MajorData>? data;

  MajorEntity({this.data});
}

class MajorData {
  int? id;
  String? name;
  String? description;
  String? icon;

  MajorData({this.id, this.name, this.icon});

  MajorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json["description"];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data["description"] = description;
    data['icon'] = icon;
    return data;
  }
}
