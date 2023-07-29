import 'package:flutter_svg/svg.dart';

class CategoryModel {
  int? id;
  String? name;
  String? logo;
  Null? meals;

  CategoryModel({
    this.id,
    this.name,
    this.logo,
    required String title,
    required SvgPicture imageUrl,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    meals = json['meals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['meals'] = this.meals;
    return data;
  }
}
