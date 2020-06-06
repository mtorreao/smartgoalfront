import 'package:mobx/mobx.dart';
part 'task_controller.g.dart';

class TaskController = _TaskControllerBase with _$TaskController;

abstract class _TaskControllerBase with Store {
  
  var list = ObservableList<String>();

  @action
  void increment() {
    
  }

}