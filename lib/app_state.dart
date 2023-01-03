import 'package:flut_pomodoro/models/pomodoro.dart';

import 'models/task.dart';

class AppState {
  List<Task> tasks = const [];
  Pomodoro pomodoro = Pomodoro();

  //AppState({this.tasks = const []});
  AppState(List<Task> tasks, Pomodoro pomodoro) {
    this.tasks = tasks;
    this.pomodoro = pomodoro;
  }
}
