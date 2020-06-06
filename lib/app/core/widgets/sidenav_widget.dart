import 'package:SmartGoalFront/app/app_controller.dart';
import 'package:SmartGoalFront/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SideNavWidget extends StatelessWidget {
  final AppController _controller = AppModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 250,
        minWidth: 150,
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 16,
        top: 16,
      ),
      decoration: BoxDecoration(
        border: Border(
            right: BorderSide(
          width: 2,
          color: Theme.of(context).dividerColor,
          style: BorderStyle.solid,
        )),
      ),
      child: Observer(builder: (_) {
        final list = _controller.navItems.toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: list,
        );
      }),
    );
  }
}
