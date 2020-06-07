import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  @observable
  String title = "";
  @observable
  bool checked = false;

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
}
