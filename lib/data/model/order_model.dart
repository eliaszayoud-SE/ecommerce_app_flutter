class OrderModel {
  int? id;
  int? userId;
  int? type;
  int? priceDelivery;
  double? price;
  int? paymentType;
  int? couponId;
  String? dateTime;
  int? status;
  double? totalPrice;
  Address? address;
  int? rating;
  String? note;

  OrderModel(
      {this.id,
        this.userId,
        this.address,
        this.type,
        this.priceDelivery,
        this.price,
        this.paymentType,
        this.couponId,
        this.status,
        this.dateTime,
        this.rating,
        this.note,
        this.totalPrice});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    type = json['type'];
    priceDelivery = json['price_delivery'];
    price = json['price'];
    paymentType = json['payment_type'];
    couponId = json['coupon_id'];
    status = json['status'];
    dateTime = json['date_time'];
    totalPrice = json['total_price'];
    rating = json['rating'];
    note = json['note'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    if (address != null) {
      data['address'] = address?.toJson();
    }
    data['type'] = type;
    data['price_delivery'] = priceDelivery;
    data['price'] = price;
    data['payment_type'] = paymentType;
    data['coupon_id'] = couponId;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['total_price'] = totalPrice;
    data['rating'] = rating;
    data['note'] = note;

    return data;
  }
}

class Address {
  int? id;
  int? userId;
  String? name;
  String? city;
  String? street;
  String? phone;
  double? lat;
  double? long;

  Address(
      {this.id,
        this.userId,
        this.name,
        this.city,
        this.street,
        this.phone,
        this.lat,
        this.long});

  Address.fromJson(Map<String, dynamic> json) {
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