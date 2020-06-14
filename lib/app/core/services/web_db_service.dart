import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';
import 'package:SmartGoalFront/app/core/interfaces/database_interface.dart';
import 'package:SmartGoalFront/app/core/util/database_event.dart';
import 'package:hive/hive.dart';

class WebDBService<T extends IDataModel> implements IDatabase<T> {
  Box<T> box;

  @override
  Future add(T model) {
    return box?.put(model.id, model);
  }

  @override
  Future delete(String id) {
    return box?.delete(id);
  }

  @override
  Future<T> get(String id) {
    return Future.value(box.get(id));
  }

  @override
  Iterable<T> list() => box.values;

  @override
  Future update(model) => box.put(model.id, model);

  @override
  void dispose() {
    // box?.close();
  }

  @override
  Future init(String databaseName) async {
    this.box = await Hive.openBox(databaseName);
  }

  @override
  Stream<DatabaseEvent<T>> watch() => box.watch().map((event) => DatabaseEvent()
    ..deleted = event.deleted
    ..value = event.value
    ..id = event.key);
}
