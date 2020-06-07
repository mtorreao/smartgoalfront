import 'package:SmartGoalFront/app/modules/task/pages/task_list/task_list_controller.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:mobx/mobx.dart';

part 'task_form_controller.g.dart';

class TaskFormController = _TaskFormControllerBase with _$TaskFormController;

abstract class _TaskFormControllerBase with Store {
  final TaskListController listController;
  _TaskFormControllerBase(this.listController);

  TaskStore task = TaskStore();

  void save() {
    this.listController.tasks.add(task);
  }
}
