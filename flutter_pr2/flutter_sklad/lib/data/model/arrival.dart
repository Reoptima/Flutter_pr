import 'package:flutter_sklad/domain/entity/arrival_entity.dart';

class Arrival extends ArrivalEntity {
  int? id;
  late String date;
  late int count;
  late int productId;

  Arrival({required this.date, required this.count, required this.productId}) : super(date: date, count: count, productId: productId);

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'count': count,
      'productId': productId
    };
  }

  factory Arrival.toFromMap(Map<String, dynamic> json) {
    return Arrival(date: json['date'], count: json['count'], productId: json['productId']);
  }
}
