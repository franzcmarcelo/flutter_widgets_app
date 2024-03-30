import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

const String defaultColorTheme = 'primary';

const Map<String, Color> themeColors = {
  defaultColorTheme: Colors.indigoAccent,
  'secondary': Colors.teal,
  'tertiary': Colors.blue,
  'quaternary': Colors.purple,
  'quinary': Colors.green,
  'senary': Colors.orange,
  'septenary': Colors.red,
  'octonary': Colors.pink,
  'nonary': Colors.amber,
  'denary': Colors.cyan,
  'undenary': Colors.lime,
};

final themeColorsProvider = Provider((ref) => themeColors);

final themeColorSelectedProvider = StateProvider<String>((ref) => defaultColorTheme);

