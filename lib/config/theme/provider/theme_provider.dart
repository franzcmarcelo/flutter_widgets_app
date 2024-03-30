import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/config/theme/app_theme.dart';
import 'package:flutter_widgets_app/config/theme/constants/constants.dart';

// inmutable
final themeColorsProvider = Provider((ref) => themeColors);

// states
final isDarkModeProvider = StateProvider<bool>((ref) => false);
final themeColorSelectedProvider = StateProvider<String>((ref) => defaultColorTheme);

// state notifier <notifier, state>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {

  ThemeNotifier(): super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorTheme(String themeColor) {
    state = state.copyWith(themeColorSelected: themeColor);
  }
}
