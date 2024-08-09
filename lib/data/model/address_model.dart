class AddressModel {
  int? id;
  int? userId;
  String? name;
  String? city;
  String? street;
  String? phone;
  double? lat;
  double? long;

  AddressModel(
      {this.id,
      this.userId,
      this.city,
      this.street,
      this.phone,
      this.lat,
      this.long});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    city = json['city'];
    street = json['street'];
    phone = json['phone'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['city'] = city;
    data['street'] = street;
    data['phone'] = phone;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}
