import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';
import 'package:SmartGoalFront/app/core/util/database_event.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IDatabase<T extends IDataModel> extends Disposable {
  Future init(String databaseName);
  Future delete(String id);
  Iterable<T> list();
  Stream<DatabaseEvent<T>> watch();
  Future add(T model);
  Future<T> get(String id);
  Future update(T model);
}
