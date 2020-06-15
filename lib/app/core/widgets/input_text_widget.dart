import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String initialValue;
  final String Function(String) onValidate;
  final FocusNode focusNode;
  final String titleText;
  final String hintText;
  final bool autofocus;

  InputTextWidget({
    this.titleText,
    this.onChanged,
    this.focusNode,
    this.initialValue,
    this.onValidate,
    this.hintText,
    this.autofocus = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: onValidate,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: titleText,
      ),
    );
  }
}
