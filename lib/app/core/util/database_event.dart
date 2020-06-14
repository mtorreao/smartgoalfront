import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';

abstract class DatabaseEvent<T extends IDataModel> {
  bool deleted;
  IDataModel value;
}
