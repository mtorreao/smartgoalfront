import 'package:SmartGoalFront/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'app/modules/task/models/task_model.dart';

void main() {
  Hive.registerAdapter(TaskModelHive());
  runApp(ModularApp(module: AppModule()));
}
