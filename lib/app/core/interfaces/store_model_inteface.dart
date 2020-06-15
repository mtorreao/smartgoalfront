import 'package:SmartGoalFront/app/core/interfaces/data_model_interface.dart';

abstract class IStoreModel<T extends IDataModel> {
  String id;
  T toDataModel();
}
