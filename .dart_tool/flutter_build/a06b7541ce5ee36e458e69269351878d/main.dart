import 'dart:ui' as ui;

import 'package:SmartGoalFront/main.dart' as entrypoint;

Future<void> main() async {
  if (true) {
    await ui.webOnlyInitializePlatform();
  }
  entrypoint.main();
}
