class UserEntity {
  int? id;
  late String name;
  late String surname;
  late String patronymic;
  late String login;
  late String password;
  late int roleId;

  UserEntity({required this.name, required this.surname, required this.patronymic, required this.login, required this.password, required this.roleId});
}