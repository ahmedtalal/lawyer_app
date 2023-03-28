class PlanEntity {
  List<PlansInfoModel>? data;

  PlanEntity({this.data});
}

class PlansInfoModel {
  int? id;
  String? name;
  int? period;
  int? price;
  String? description;

  PlansInfoModel(
      {this.id, this.name, this.period, this.price, this.description});

  PlansInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    period = json['period'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['period'] = this.period;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}
