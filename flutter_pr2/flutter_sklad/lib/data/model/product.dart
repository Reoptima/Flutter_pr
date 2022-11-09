import 'package:flutter_sklad/domain/entity/product_entity.dart';
import 'dart:ffi';

class Product extends ProductEntity {
  int? id;
  late double price;
  late String name;
  late int productCategoryId;

  Product({required this.price, required this.name,required this.productCategoryId}) : super(price: price, name: name, productCategoryId: productCategoryId);

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'name': name,
      'productCategoryId': productCategoryId,
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(price: json['price'], name: json['name'], productCategoryId: json['productCategoryId']);
  }
}
