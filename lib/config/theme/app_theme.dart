import 'package:flutter/material.dart';

const Map<String, Color> colors = {
  'primary': Colors.indigoAccent,
  'secondary': Colors.teal,
  'tertiary': Colors.blue,
};

class AppTheme {

  final String selectedColor;

  AppTheme({
    this.selectedColor = 'primary',
  })
  : assert(colors.containsKey(selectedColor), 'Color $selectedColor is not defined in the theme');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );
}
