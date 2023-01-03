import 'dart:async';
import 'package:flut_pomodoro/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../app_state.dart';

class Pomodoro {
  int breakTime = 5;
  int workTime = 10;
  int nbCylces = 4;
  int ellapsedTime = 0;
  bool started = false;
}
