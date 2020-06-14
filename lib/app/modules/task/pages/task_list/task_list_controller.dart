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
      print(tasks);
    });
  }

  Future init() async {
    await _repository.init();
    sub = this._repository.watch().listen((event) {
      if (event.deleted) {
        tasks.removeWhere((element) => element.id == event.id);
      } else {
        tasks.add(event.value.toStore());
      }
    });
  }

  Future<void> delete(String id) async {
    await _repository.delete(id);
  }

  void dispose() {
    sub?.cancel();
  }

  ObservableList<TaskStore> tasks = ObservableList<TaskStore>();
}
