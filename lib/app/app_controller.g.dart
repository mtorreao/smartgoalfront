// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$hasDrawerAtom = Atom(name: '_AppControllerBase.hasDrawer');

  @override
  bool get hasDrawer {
    _$hasDrawerAtom.reportRead();
    return super.hasDrawer;
  }

  @override
  set hasDrawer(bool value) {
    _$hasDrawerAtom.reportWrite(value, super.hasDrawer, () {
      super.hasDrawer = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  void showDrawer() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.showDrawer');
    try {
      return super.showDrawer();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideDrawer() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.hideDrawer');
    try {
      return super.hideDrawer();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasDrawer: ${hasDrawer}
    ''';
  }
}
