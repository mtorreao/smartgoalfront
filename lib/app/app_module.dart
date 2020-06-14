import 'package:SmartGoalFront/app/app_controller.dart';
import 'package:SmartGoalFront/app/app_widget.dart';
import 'package:SmartGoalFront/app/core/services/web_db_service.dart';
import 'package:SmartGoalFront/app/modules/task/models/task_model.dart';
import 'package:SmartGoalFront/app/modules/task/task_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppModule extends MainModule {
  static bool isWeb = kIsWeb;

  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => WebDBService<TaskModel>()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: TaskModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
