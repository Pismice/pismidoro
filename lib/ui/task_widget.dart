import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final void Function(bool? a)? onChanged;

  const TaskWidget({Key? key, required this.task, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(task.name),
      Checkbox(
        value: task.finished,
        onChanged: onChanged,
      )
    ]);
  }
}
