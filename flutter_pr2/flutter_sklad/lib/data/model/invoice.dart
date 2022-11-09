import 'package:flutter_sklad/domain/entity/invoice_entity.dart';

class Invoice extends InvoiceEntity {
  int? id;
  late String date;
  late int count;
  late int productId;
  late int userId;
  late int clientId;

  Invoice({required this.date, required this.count, required this.productId, required this.userId, required this.clientId}) : super(date: date, count: count, productId: productId, userId: userId, clientId: clientId);

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'count': count,
      'productId': productId,
      'userId': userId,
      'issuePointId': clientId,
    };
  }

  factory Invoice.toFromMap(Map<String, dynamic> json) {
    return Invoice(date: json['date'], count: json['count'], productId: json['productId'], userId: json['userId'], clientId: json['issuePointId']);
  }
}
