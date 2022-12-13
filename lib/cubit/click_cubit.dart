import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickInitial());

  List<String> logs = [];
  int count = 0;
  bool theme = true;

  void onClickPlus() {
    count += theme ? 1 : 2;
    if (count == 10) {
      emit(ClickError('Счётчик равен 10'));
      count = 0;
    }
    logs.add('Счётчик увеличен на ${theme ? '1' : '2'}');
    emit(Click(count, logs));
  }

  void onClickRemove() {
    count -= theme ? 1 : 2;
    if (count == -10) {
      emit(ClickError('Счётчик равен -10'));
      count = 0;
    }
    logs.add('Счётчик уменьшен на ${theme ? '1' : '2'}');
    emit(Click(count, logs));
  }

  void changeTheme() {
    theme = !theme;
    logs.add('Тема изменена на ${theme ? 'светлую' : 'тёмную'}');
    emit(Click(count, logs));
  }
}
