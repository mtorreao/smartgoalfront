import 'package:SmartGoalFront/app/modules/task/pages/task_form/task_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskFormPage extends StatefulWidget {
  final String title;
  const TaskFormPage({Key key, this.title = "TaskForm"}) : super(key: key);

  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState
    extends ModularState<TaskFormPage, TaskFormController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final task = controller.task;
      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (_) {
              return TextFormField(
                onChanged: task.setTitle,
                initialValue: task.title,
              );
            }),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () {
                print(controller.task);

                
              },
              child: Text('Save'),
            ),
          ],
        ),
      );
    });
  }
}
