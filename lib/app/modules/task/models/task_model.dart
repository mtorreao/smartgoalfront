import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';
import 'package:SmartGoalFront/app/core/models/base_model.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0, adapterName: "TaskModelHive")
class TaskModel extends BaseModel implements IDataModel, Comparable<TaskModel> {
  @HiveField(1)
  String title;
  @HiveField(2)
  bool checked;
  @HiveField(3)
  DateTime updatedAt;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  DateTime dueDate;

  TaskModel({
    this.title,
    this.checked = false,
    String id,
    this.createdAt,
    this.dueDate,
    this.updatedAt,
  }) : super(id: id);

  @override
  TaskStore toStore() => TaskStore(
        checked: this.checked,
        title: this.title,
        id: this.id,
        createdAt: this.createdAt,
        dueDate: this.dueDate,
        updatedAt: this.updatedAt,
      );

  @override
  String toString() => '''
    {
      id=$id, 
      title=$title, 
      checked=$checked,
      createdAt=$createdAt,
      updatedAt=$updatedAt,
      dueDate=$dueDate
    }''';

  @override
  int compareTo(other) => this.title.compareTo(other.title);
}
