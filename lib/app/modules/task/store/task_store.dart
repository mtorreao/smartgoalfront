import 'package:SmartGoalFront/app/core/interfaces/store_model_inteface.dart';
import 'package:SmartGoalFront/app/modules/task/models/task_model.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store implements IStoreModel {
  @observable
  String title = "";
  @observable
  bool checked = false;

  _TaskStoreBase({
    this.title,
    this.checked,
  });

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void toggleChecked(bool value) {
    checked = value;
  }

  @override
  String toString() {
    return 'title=$title, checked=$checked';
  }

  TaskModel toDataModel() => TaskModel(
        checked: this.checked,
        title: this.title,
      );
}
