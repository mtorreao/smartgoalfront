import 'package:SmartGoalFront/app/core/util/dialogs.dart';
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
  Widget build(BuildContext context) => Observer(builder: (_) {
        final list = controller.tasks.toList();
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              final item = list[index];
              return ListTile(
                title: Text(item.title),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Observer(builder: (_) {
                        bool checked = item.checked;
                        return IconButton(
                            icon: Icon(
                              checked
                                  ? Icons.check
                                  : Icons.check_box_outline_blank,
                              color: checked
                                  ? Colors.green
                                  : Theme.of(context).textTheme.bodyText1.color,
                            ),
                            onPressed: () =>
                                controller.toggleChecked(index, checked));
                      }),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () async {
                          var canDelete =
                              await Dialogs.deleteActionDialog(context);
                          print('Resultado da popup $canDelete');
                          if (canDelete) {
                            controller.delete(item.id);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
      });
}
