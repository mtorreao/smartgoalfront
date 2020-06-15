import 'package:flutter/material.dart';

class InputDateTimeWidget extends StatelessWidget {
  final String labelText;
  final Function(DateTime) onChanged;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final TimeOfDay initialTime;
  final String initialValue;

  const InputDateTimeWidget({
    Key key,
    this.labelText,
    this.onChanged,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.initialTime,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(
          Icons.date_range,
        ),
      ),
      keyboardType: TextInputType.datetime,
      initialValue: initialValue ?? '',
      onTap: () async {
        var selectedDate = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime.now(),
          lastDate: lastDate ??
              DateTime.now().add(
                Duration(
                  days: 365,
                ),
              ),
        );
        if (selectedDate != null) {
          var selectedTime = await showTimePicker(
              context: context, initialTime: initialTime ?? TimeOfDay.now());
          if (onChanged != null) {
            if (selectedTime == null) {
              onChanged(DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
              ));
            } else {
              onChanged(DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              ));
            }
          }
          return;
        }
      },
    );
  }
}
