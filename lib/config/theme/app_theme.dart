import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/theme/constants/constants.dart';

class AppTheme {

  final String themeColorSelected;
  final bool isDarkMode;

  AppTheme({
    this.themeColorSelected = defaultColorTheme,
    this.isDarkMode = false,
  })
  : assert(
    themeColors.keys.contains(themeColorSelected), 'Color $themeColorSelected is not defined in the theme'
  );

  ThemeData getTheme()
  => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: themeColors[themeColorSelected],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

  AppTheme copyWith({ String? themeColorSelected, bool? isDarkMode})
  => AppTheme(
    themeColorSelected: themeColorSelected ?? this.themeColorSelected,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
