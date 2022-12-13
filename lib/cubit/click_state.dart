part of 'click_cubit.dart';

@immutable
abstract class ClickState {}

class ClickInitial extends ClickState {}

class ClickError extends ClickState {
  final String message;
  ClickError(this.message);
}

class Click extends ClickState {
  List<String> logs = [];
  int count;
  Click(this.count, this.logs);
}
