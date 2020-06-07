import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:mobx/mobx.dart';

part 'task_list_controller.g.dart';

class TaskListController = _TaskListControllerBase with _$TaskListController;

abstract class _TaskListControllerBase with Store {
  _TaskListControllerBase() {
    autorun((rx) {
      print(tasks);
    });
  }

  ObservableList<TaskStore> tasks = ObservableList<TaskStore>()
    ..add(TaskStore()..title = "ABC")
    ..add(TaskStore()..title = "321");
}
