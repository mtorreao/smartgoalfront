import 'package:SmartGoalFront/app/core/interfaces/store_model_inteface.dart';
import 'package:SmartGoalFront/app/modules/task/models/task_model.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store implements IStoreModel<TaskModel> {
  @observable
  String id;
  @observable
  String title = "";
  @observable
  bool checked;
  DateTime createdAt;
  DateTime updatedAt;
  @observable
  DateTime dueDate;

  _TaskStoreBase({
    this.id,
    this.title,
    this.checked = false,
    this.createdAt,
    this.updatedAt,
    this.dueDate,
  });

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDueDate(DateTime date) {
    print(date);
    dueDate = date;
  }

  @action
  void toggleChecked(bool value) {
    checked = value;
  }

  @override
  String toString() {
    return '''
    {
      id=$id, 
      title=$title, 
      checked=$checked,
      createdAt=$createdAt,
      updatedAt=$updatedAt,
      dueDate=$dueDate
    }''';
  }

  TaskModel toDataModel() => TaskModel(
        checked: this.checked,
        title: this.title,
        id: this.id,
        createdAt: this.createdAt,
        dueDate: this.dueDate,
        updatedAt: this.updatedAt,
      );
}
