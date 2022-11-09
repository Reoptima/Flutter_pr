import 'package:flutter_sklad/domain/entity/product_on_stock.dart';

class Provider extends ProductOnStock {
  int? id;
  late String product;
  late String stockId;
  late String value;

  Provider({required this.product, required this.stockId, required this.value}) : super(product: product, stockId: stockId, value: value);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product,
      'stockId': stockId,
      'value': value
    };
  }

  factory Provider.toFromMap(Map<String, dynamic> json) {
    return Provider(product: json['product'], stockId: json['stock'], value: json['value']);
  }
}
