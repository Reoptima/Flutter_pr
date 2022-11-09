class InvoiceEntity {
  int? id;
  late String date;
  late int count;
  late int productId;
  late int userId;
  late int clientId;

  InvoiceEntity({required this.date, required this.count, required this.productId, required this.userId, required this.clientId});
}