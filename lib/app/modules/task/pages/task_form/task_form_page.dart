import 'package:SmartGoalFront/app/core/widgets/input_date_time_widget.dart';
import 'package:SmartGoalFront/app/core/widgets/input_text_widget.dart';
import 'package:SmartGoalFront/app/modules/task/pages/task_form/task_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({
    Key key,
  }) : super(key: key);

  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState
    extends ModularState<TaskFormPage, TaskFormController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Form(
          key: controller.formKey,
          autovalidate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                String title = controller.task.title;
                return InputTextWidget(
                  titleText: 'Title',
                  focusNode: controller.focusNode,
                  hintText: 'Go to Gym',
                  initialValue: title,
                  onChanged: controller.task.setTitle,
                  onValidate: controller.validateTitle,
                );
              }),
              Observer(builder: (_) {
                var date = controller.task.dueDate;
                var formatter = new DateFormat('dd/MM/yyyy HH:mm');
                return InputDateTimeWidget(
                  labelText: 'Due Date',
                  initialDate: date,
                  onChanged: controller.task.setDueDate,
                  initialValue: date == null ? '' : formatter.format(date),
                  // initialValue: '18/02/2020',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
