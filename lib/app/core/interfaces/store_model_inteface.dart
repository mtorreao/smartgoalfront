import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';

abstract class IStoreModel {
  String id;
  IDataModel toDataModel();
}
