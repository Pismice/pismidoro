import 'package:flut_pomodoro/models/pomodoro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PomodoroWidget extends StatelessWidget {
  final Pomodoro pomodoro;
  final void Function()? onPressed;

  const PomodoroWidget({super.key, required this.pomodoro, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Timer"),
        Row(
          children: [
            Text(pomodoro.ellapsedTime.toString()),
            FloatingActionButton(onPressed: onPressed, child: Text("Start"))
          ],
        )
      ],
    );
  }
}
