import 'package:flut_pomodoro/reducer.dart';
import 'package:flut_pomodoro/ui/pomodoro_widget.dart';
import 'package:flut_pomodoro/ui/redux_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Store<AppState> _store = Store<AppState>(updateTaskReducer,
      initialState:
          AppState(tasks: [Task("name"), Task("Testo 1"), Task("bouliste")]));
  // TODO : remove the starting tasks

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        title: "bito",
        theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
        home: Scaffold(
          appBar: AppBar(title: Text("Pismidoro")),
          body: ReduxScreen(),
        ),
      ),
    );
  }
}
