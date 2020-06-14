import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class Dialogs {
  static Future<bool> deleteActionDialog<bool>(
    BuildContext context, {
    String title = 'Delete action',
    String description =
        'This action will remove the object completely from the app. Do you wish to do that?',
    MaterialButton buttonYes,
    MaterialButton buttonNo,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actionsPadding: EdgeInsets.only(
          right: 16,
        ),
        actions: [
          buttonYes != null
              ? buttonYes
              : FlatButton(
                  onPressed: () => Modular.link.pop(true),
                  child: Text("YES"),
                ),
          buttonNo != null
              ? buttonNo
              : FlatButton(
                  onPressed: () => Modular.link.pop(false),
                  child: Text("NO"),
                ),
        ],
      ),
    );
  }
}
