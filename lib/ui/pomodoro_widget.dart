import 'dart:async';

import 'package:flut_pomodoro/actions.dart';
import 'package:flut_pomodoro/models/pomodoro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../app_state.dart';

class PomodoroWidget extends StatefulWidget {
  final Pomodoro pomodoro;
  //final void Function()? onPressed;

  const PomodoroWidget({super.key, required this.pomodoro});

  @override
  State<PomodoroWidget> createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget> {
  void onPressed() {
    if (widget.pomodoro.started) {
      return;
    }
    widget.pomodoro.started = true;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!widget.pomodoro.started) {
        timer.cancel();
        return;
      }
      print(timer.tick); // TODO REMOVE
      widget.pomodoro.ellapsedTime++;
      StoreProvider.of<AppState>(context)
          .dispatch(UpdatePomodoroAction(widget.pomodoro));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Timer"),
        Row(
          children: [
            Text(widget.pomodoro.ellapsedTime.toString()),
            FloatingActionButton(onPressed: onPressed, child: Text("Start")),
            FloatingActionButton(
                onPressed: (() => widget.pomodoro.started = false),
                child: Text("STOP"),
                key: UniqueKey())
          ],
        )
      ],
    );
  }
}
