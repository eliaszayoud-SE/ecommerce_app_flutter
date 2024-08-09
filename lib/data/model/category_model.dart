class CategoryModel {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? date;

  CategoryModel({this.id, this.name, this.nameAr, this.image, this.date});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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