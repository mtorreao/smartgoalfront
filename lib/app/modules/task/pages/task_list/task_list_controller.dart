import 'dart:async';

import 'package:SmartGoalFront/app/core/interfaces/repository_interface.dart';
import 'package:SmartGoalFront/app/core/util/database_event.dart';
import 'package:SmartGoalFront/app/modules/task/models/task_model.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'task_list_controller.g.dart';

class TaskListController = _TaskListControllerBase with _$TaskListController;

abstract class _TaskListControllerBase extends Disposable with Store {
  final IRepository<TaskModel> _repository;

  StreamSubscription<DatabaseEvent<TaskModel>> sub;

  _TaskListControllerBase(this._repository) {
    autorun((rx) {
      print("Hello Autorun");
    });
  }

  Future init() async {
    await _repository.init();
    sub = this._repository.watch().listen((event) {
      if (event.deleted) {
        tasks.removeWhere((element) => element.id == event.id);
      } else if (tasks.any((element) => element.id == event.id)) {
        var index = tasks.indexWhere((element) => element.id == event.id);
        tasks.removeAt(index);
        tasks.insert(index, event.value.toStore());
      } else {
        tasks.add(event.value.toStore());
      }
    });
    _repository.list().toList()
      ..sort()
      ..forEach((e) => tasks.add(e.toStore()));
  }

  Future<void> delete(String id) async {
    await _repository.delete(id);
  }

  void dispose() {
    sub?.cancel();
  }

  void toggleChecked(int index, bool checked) {
    var task = tasks.elementAt(index);
    task.checked = !checked;
    _repository.update(task.toDataModel());
  }

  ObservableList<TaskStore> tasks = ObservableList<TaskStore>();
}
