import 'package:flutter_sklad/domain/entity/productCategory_entity.dart';

class ProductCategory extends ProductCategoryEntity {
  int? id;
  late String name;

  ProductCategory({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ProductCategory.toFromMap(Map<String, dynamic> json) {
    return ProductCategory(name: json['name']);
  }
}
