import 'package:SmartGoalFront/app/core/interfaces/database_interface.dart';
import 'package:SmartGoalFront/app/core/util/database_event.dart';
import 'package:SmartGoalFront/app/modules/task/models/task_model.dart';
import 'package:hive/hive.dart';

class WebDBService<T> implements IDatabase<T> {
  Box<T> box;

  @override
  Future add(model) {
    box?.add(model);
  }

  @override
  Future delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Iterable<T> list() {
    return box.values;
  }

  @override
  Future update(model) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void dispose() {
    box?.close();
  }

  @override
  Future init(String databaseName) async {
    // await Hive.init(path);
    Hive.registerAdapter(TaskModelHive());
    this.box = await Hive.openBox(databaseName);
    // Hive.registerAdapter(TaskModel());
  }

  @override
  Stream<DatabaseEvent<T>> watch() => box.watch().map((event) => event.value);
}
