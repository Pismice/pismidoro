import 'package:flut_pomodoro/models/pomodoro.dart';

import 'models/task.dart';

class UpdateTaskAction {
  final Task updatedTask;

  UpdateTaskAction(this.updatedTask);
}

class UpdatePomodoroAction {
  final Pomodoro updatedPomodoro;

  UpdatePomodoroAction(this.updatedPomodoro);
}
