import 'package:flut_pomodoro/actions.dart';
import 'package:flut_pomodoro/app_state.dart';
import 'package:flut_pomodoro/models/pomodoro.dart';
import 'package:flut_pomodoro/models/task.dart';
import 'package:flut_pomodoro/ui/task_widget.dart';
import 'package:flut_pomodoro/ui/pomodoro_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ReduxScreen extends StatelessWidget {
  ReduxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Here we convert the AppState into a list of tasks
    return Column(
      children: [
        StoreConnector<AppState, Pomodoro>(
          converter: ((store) => store.state.pomodoro),
          builder: (context, Pomodoro pomodoro) => PomodoroWidget(
            pomodoro: pomodoro,
          ),
        ),
        StoreConnector<AppState, List<Task>>(
          converter: ((store) => store.state.tasks),
          builder: (context, List<Task> stateTasks) => Expanded(
            child: Column(
              children: [
                ...stateTasks
                    .map((e) => TaskWidget(
                        task: e,
                        onChanged: (value) {
                          e.finished = !e.finished;
                          StoreProvider.of<AppState>(context)
                              .dispatch(UpdateTaskAction(e));
                        }))
                    .toList(),
                Text("Finished tasks : "),
                Expanded(
                    child: ListView.builder(
                        itemCount: stateTasks
                            .where((element) => element.finished)
                            .length,
                        itemBuilder: ((context, index) => ListTile(
                                title: Text(
                              stateTasks
                                  .where((element) => element.finished)
                                  .toList()[index]
                                  .name,
                            )))))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
