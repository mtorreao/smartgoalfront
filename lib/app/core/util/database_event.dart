import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';

class DatabaseEvent<T extends IDataModel> {
  bool deleted;
  String id;
  IDataModel value;
}
