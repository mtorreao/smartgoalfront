import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract class BaseModel {
  @HiveField(0)
  String id;

  BaseModel({this.id}) {
    if (this.id == null) {
      this.id = Uuid().v4().toString();
    }
  }
}
