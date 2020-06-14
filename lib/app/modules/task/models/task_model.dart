import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0, adapterName: "TaskModelHive")
class TaskModel extends BaseModel implements IDataModel {
  @HiveField(1)
  String title;
  @HiveField(2)
  bool checked;

  TaskModel({
    this.title,
    this.checked = false,
    String id,
  }) : super(id: id);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};

  @override
  TaskStore toStore() => TaskStore(
        checked: this.checked,
        title: this.title,
        id: this.id,
      );
}

abstract class BaseModel {
  @HiveField(0)
  String id;

  BaseModel({this.id}) {
    if (this.id == null) {
      id = Uuid().v4().toString();
    }
  }
}
