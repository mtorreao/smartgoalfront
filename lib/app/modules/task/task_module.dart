import 'package:SmartGoalFront/app/app_module.dart';
import 'package:SmartGoalFront/app/core/widgets/layout_widget.dart';
import 'package:SmartGoalFront/app/modules/task/pages/task_form/task_form_controller.dart';
import 'package:SmartGoalFront/app/modules/task/pages/task_form/task_form_page.dart';
import 'package:SmartGoalFront/app/modules/task/pages/task_list/task_list_controller.dart';
import 'package:SmartGoalFront/app/modules/task/pages/task_list/task_list_page.dart';
import 'package:SmartGoalFront/app/modules/task/repositories/task_repository.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TaskStore()),
        Bind((i) => TaskFormController(i.get())),
        Bind((i) => TaskListController(i.get())),
        Bind((i) => TaskRepository(AppModule.to.get())),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (context, args) => LayoutWidget(
            TaskListPage(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Modular.link.pushNamed('/new');
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
        Router(
          '/new',
          child: (context, args) => LayoutWidget(TaskFormPage()),
        )
      ];
}
