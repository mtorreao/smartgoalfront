import 'package:SmartGoalFront/app/core/interfaces/store_model_inteface.dart';

abstract class IDataModel {
  String id;
  IStoreModel toStore();
}
