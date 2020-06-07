import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:SmartGoalFront/app/modules/task/store/task_store.dart';
import 'package:SmartGoalFront/app/modules/task/task_module.dart';

void main() {
  initModule(TaskModule());
  // TaskStore task;
  //
  setUp(() {
    //     task = TaskModule.to.get<TaskStore>();
  });

  group('TaskStore Test', () {
    //   test("First Test", () {
    //     expect(task, isInstanceOf<TaskStore>());
    //   });

    //   test("Set Value", () {
    //     expect(task.value, equals(0));
    //     task.increment();
    //     expect(task.value, equals(1));
    //   });
  });
}
