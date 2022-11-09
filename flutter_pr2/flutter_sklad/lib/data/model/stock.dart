import 'package:flutter_sklad/domain/entity/stock_entity.dart';

class Stock extends StockEntity {
  int? id;
  late String name;

  Stock({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {
      'name': name
    };
  }

  factory Stock.toFromMap(Map<String, dynamic> json) {
    return Stock(name: json['name']);
  }
}