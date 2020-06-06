import 'package:SmartGoalFront/app/core/widgets/nav_item_widget.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  ObservableList<NavItemWidget> navItems = ObservableList<NavItemWidget>()
    ..add(NavItemWidget(
      text: "Hello",
    ));

  @observable
  bool hasDrawer = false;

  @action
  void showDrawer() {
    hasDrawer = true;
  }

  @action
  void hideDrawer() {
    hasDrawer = false;
  }
}
