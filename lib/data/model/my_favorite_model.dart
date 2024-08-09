class MyFavoriteModel {
  int? id;
  int? categoryId;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  int? count;
  double? price;
  int? discount;
  String? date;

  MyFavoriteModel(
      {this.id,
        this.categoryId,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.image,
        this.count,
        this.price,
        this.discount,
        this.date});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    count = json['count'];
    price = json['price'];
    discount = json['discount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['image'] = image;
    data['count'] = count;
    data['price'] = price;
    data['discount'] = discount;
    data['date'] = date;
    return data;
  }
}