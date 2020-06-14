import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';
import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0, adapterName: "TaskModelHive")
class TaskModel implements IDataModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool checked = true;

  TaskModel({
    this.title,
    this.checked,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};

  @override
  TaskStore toStore() => TaskStore(checked: this.checked, title: this.title);
}
