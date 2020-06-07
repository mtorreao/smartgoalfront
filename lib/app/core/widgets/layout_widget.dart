import 'package:SmartGoalFront/app/app_module.dart';
import 'package:flutter/material.dart';

import '../../app_controller.dart';

class LayoutWidget extends StatefulWidget {
  final Widget page;
  final Widget secondColumn;
  final Widget sideNav;
  final AppBar appBar;
  final Drawer drawer;
  final FloatingActionButton floatingActionButton;

  LayoutWidget(
    this.page, {
    this.secondColumn,
    this.appBar,
    this.sideNav,
    this.drawer,
    this.floatingActionButton,
  });

  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  final AppController _controller = AppModule.to.get();
  AppBar appBar;

  @override
  void initState() {
    super.initState();
    if (widget.appBar == null) {
      appBar = AppBar(
        title: Text('Smart Goal'),
      );
    } else {
      appBar = widget.appBar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isMobile = maxWidth < 900;
        final hasSideNav = widget.sideNav != null;
        var hasSecondColumn = widget.secondColumn != null;
        final double sideNavWidth = hasSecondColumn ? 200 : 300;
        final hasDrawer = widget.drawer != null;

        Widget body;

        if (isMobile) {
          _controller.showDrawer();
          body = widget.page;
        } else {
          _controller.hideDrawer();
          double columnWidth = 0;
          if (hasSecondColumn && hasSideNav) {
            columnWidth = (maxWidth - sideNavWidth) / 2;
          } else if (hasSecondColumn) {
            columnWidth = maxWidth / 2;
          } else {
            columnWidth = 700;
          }
          if (hasSideNav && hasSecondColumn) {
            hasSecondColumn = maxWidth - sideNavWidth - columnWidth > 600;
            if (!hasSecondColumn) {
              columnWidth = maxWidth - sideNavWidth;
            }
          }
          body = Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasSideNav)
                Container(
                  width: sideNavWidth,
                  child: widget.sideNav,
                ),
              Container(
                width: columnWidth,
                child: widget.page,
              ),
              if (hasSecondColumn)
                Container(
                  width: columnWidth,
                  child: widget.secondColumn,
                ),
            ],
          );
        }

        return Scaffold(
          appBar: appBar,
          body: body,
          floatingActionButton: widget.floatingActionButton,
        );
      },
    );
  }
}
