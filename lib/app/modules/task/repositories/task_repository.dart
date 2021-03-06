import 'package:SmartGoalFront/app/core/interfaces/database_interface.dart';
import 'package:SmartGoalFront/app/core/interfaces/repository_interface.dart';
import 'package:SmartGoalFront/app/core/util/database_event.dart';
import 'package:SmartGoalFront/app/modules/task/models/task_model.dart';

class TaskRepository implements IRepository<TaskModel> {
  final IDatabase<TaskModel> dbContext;

  TaskRepository(this.dbContext);

  Future init() async {
    await dbContext.init('tasks');
  }

  //dispose will be called automatically
  @override
  void dispose() {
    dbContext.dispose();
  }

  @override
  Future add(model) => this.dbContext.add(model);

  @override
  Iterable<TaskModel> list() => dbContext.list();

  @override
  Stream<DatabaseEvent<TaskModel>> watch() => this.dbContext.watch();

  @override
  Future<void> delete(String id) => this.dbContext.delete(id);

  @override
  Future<void> update(TaskModel model) => this.dbContext.update(model);
}
