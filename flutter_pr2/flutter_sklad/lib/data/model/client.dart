import 'package:flutter_sklad/domain/entity/client_entity.dart';

class Client extends ClientEntity {
  int? id;
  late String name;
  late String itn;

  Client({required this.name, required this.itn}) : super(name: name, itn: itn);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'itn': itn
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(name: json['name'], itn: json['address']);
  }
}
