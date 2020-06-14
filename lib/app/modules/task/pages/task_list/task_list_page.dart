import 'package:SmartGoalFront/app/modules/task/pages/task_list/task_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState
    extends ModularState<TaskListPage, TaskListController> {
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final list = controller.tasks.toList();
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final item = list[index];
            return ListTile(
              title: Text(item.title),
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => controller.delete(item.id)),
            );
          });
    });
  }
}
