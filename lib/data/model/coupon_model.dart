class CouponModel {
  int? id;
  String? name;
  int? count;
  int? discount;
  String? expireDate;

  CouponModel({this.id, this.name, this.count, this.discount, this.expireDate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    discount = json['discount'];
    expireDate = json['expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['count'] = count;
    data['discount'] = discount;
    data['expire_date'] = expireDate;
    return data;
  }
}