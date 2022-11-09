import 'package:flutter_sklad/domain/entity/user_entity.dart';

class User extends UserEntity {
  int? id;
  late String name;
  late String surname;
  late String patronymic;
  late String login;
  late String password;
  late int roleId;


  User({required this.name, required this.surname, required this.patronymic, required this.login, required this.password, required this.roleId}) : super(name: name, surname: surname, patronymic: patronymic, login: login, password: password, roleId: roleId);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'login': login,
      'password': password,
      'roleId': roleId,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(name: json['name'], surname: json['surname'], patronymic: json['patronymic'], login: json['login'], password: json['password'], roleId: json['roleId']);
  }

}