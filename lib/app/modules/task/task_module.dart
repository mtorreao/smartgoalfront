import 'package:SmartGoalFront/app/modules/task/task_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskModule extends ChildModule {
  @override
  List<Bind> get binds => [

  ];

  @override
  List<Router> get routers => [
    Router('/', child: (context, args) => TaskListPage()),
  ];

}