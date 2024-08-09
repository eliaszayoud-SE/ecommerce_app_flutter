class CartModel {
  int? id;
  int? qty;
  Product? product;
  double? totalPrice;

  CartModel({this.id, this.qty, this.product, this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qty'] = qty;
    if (product != null) {
      data['product'] = product?.toJson();
    }
    data['total_price'] = totalPrice;
    return data;
  }
}

class Product {
  int? id;
  bool? isFavorite;
  Category? category;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  int? count;
  double? price;
  double? priceWithDiscount;
  int? discount;
  String? date;

  Product(
      {this.id,
        this.isFavorite,
        this.category,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.image,
        this.count,
        this.price,
        this.priceWithDiscount,
        this.discount,
        this.date});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isFavorite = json['is_favorite'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    count = json['count'];
    price = json['price'];
    priceWithDiscount = json['price_with_discount'];
    discount = json['discount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_favorite'] = isFavorite;
    if (category != null) {
      data['category'] = category?.toJson();
    }
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['image'] = image;
    data['count'] = count;
    data['price'] = price;
    data['price_with_discount'] = priceWithDiscount;
    data['discount'] = discount;
    data['date'] = date;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? date;

  Category({this.id, this.name, this.nameAr, this.image, this.date});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['image'] = image;
    data['date'] = date;
    return data;
  }
}