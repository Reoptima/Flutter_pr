import 'dart:ffi';

class ProductEntity {
  int? id;
  late double price;
  late String name;
  late int productCategoryId;

  ProductEntity({required this.price, required this.name, required this.productCategoryId});
}