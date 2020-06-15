import 'package:SmartGoalFront/app/core/interfaces/repository_interface.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'task_form_controller.g.dart';

class TaskFormController = _TaskFormControllerBase with _$TaskFormController;

abstract class _TaskFormControllerBase with Store {
  final IRepository repository;
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  TaskStore task = TaskStore();

  _TaskFormControllerBase(this.repository);

  Future<bool> save() async {
    print('Save Form task: $task');
    if (formKey.currentState.validate()) {
      await this.repository.add(task.toDataModel());

      return true;
    }

    return false;
  }

  bool validate() {
    return validateTitle(task.title) ?? false;
  }

  String validateTitle(String value) {
    if (value == null) return "Required field";
    if (value.length < 3) return "Minimum of 3 character";
    return null;
  }
}
