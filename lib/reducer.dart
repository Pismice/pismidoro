import 'package:flut_pomodoro/actions.dart';
import 'package:flut_pomodoro/app_state.dart';
import 'package:flut_pomodoro/models/task.dart';

AppState updateTaskReducer(AppState state, dynamic action) {
  if (action is UpdateTaskAction) {
    return AppState(
        state.tasks
            .map((e) =>
                e.name == action.updatedTask.name ? action.updatedTask : e)
            .toList(),
        state.pomodoro);
  }
  if (action is UpdatePomodoroAction) {
    return AppState(state.tasks, action.updatedPomodoro);
  }
  return state;
}
