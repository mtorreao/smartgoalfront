import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';
import 'package:SmartGoalFront/app/core/util/database_event.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IRepository<T extends IDataModel> extends Disposable {
  Future init();
  Future add(T model);
  Iterable<T> list();
  Stream<DatabaseEvent<T>> watch();
  Future<void> delete(String id);
  Future<void> update(T model);
}
