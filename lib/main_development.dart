import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_queues_app/app/app.dart';
import 'package:task_queues_app/common/bloc/simple_bloc_delegate.dart';
import 'package:task_queues_app/common/constant/env.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(App(env: EnvValue.development));
  }, (error, stackTrace) async {});
}
