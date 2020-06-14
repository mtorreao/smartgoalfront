import 'package:SmartGoalFront/app/core/interfaces/repository_interface.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:mobx/mobx.dart';

part 'task_form_controller.g.dart';

class TaskFormController = _TaskFormControllerBase with _$TaskFormController;

abstract class _TaskFormControllerBase with Store {
  final IRepository repository;

  TaskStore task = TaskStore();

  _TaskFormControllerBase(this.repository);

  Future<void> save() {
    this.repository.add(task.toDataModel());
  }
}
