import 'package:flutter/material.dart';

Future<DateTime?> selectDateTime(BuildContext context) async {
  final initialDate = DateTime.now();

  Theme dateTimeTheme(Widget? child, Color backgroundColor) => Theme(
        data: ThemeData.light().copyWith(
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: backgroundColor,
            headerForegroundColor: backgroundColor,
          ),
          primaryColor: backgroundColor,
          colorScheme: ColorScheme.light(primary: backgroundColor),
        ),
        child: child!,
      );

  DateTime? datePiker = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1800),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return dateTimeTheme(child, Colors.blue.shade400);
      });
  return datePiker;
}
