import 'package:SmartGoalFront/app/core/widgets/layout_widget.dart';
import 'package:SmartGoalFront/app/core/widgets/sidenav_widget.dart';
import 'package:SmartGoalFront/app/modules/task/task_controller.dart';
import 'package:SmartGoalFront/app/modules/task/task_list_page.dart';
import 'package:SmartGoalFront/app/modules/task/task_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TaskRepository()),
        Bind((i) => TaskController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (context, args) => LayoutWidget(
            TaskListPage(),
            secondColumn: Container(
              child: Text('Coluna 2'),
            ),
            sideNav: SideNavWidget(),
            drawer: Drawer(),
          ),
        ),
      ];
}
