import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/config/theme/constants/constants.dart';
import 'package:flutter_widgets_app/config/theme/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode
            ),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final String themeColorSelected = ref.watch(themeNotifierProvider).themeColorSelected;
    final Map<String, Color> themeColors = ref.watch(themeColorsProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.color_lens),
                label: const Text('Random'),
                onPressed: () {
                  final random = Random();
                  final randomIndexColor = random.nextInt(themeColors.length);
                  ref.read(themeNotifierProvider.notifier).changeColorTheme(themeColors.keys.elementAt(randomIndexColor));
                },
              ),
              TextButton.icon(
                label: const Text('Reset'),
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  if(themeColorSelected != defaultColorTheme) ref.read(themeNotifierProvider.notifier).changeColorTheme(defaultColorTheme);
                  if(isDarkMode) ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                },
              )
            ]
          ),
        ),
        Expanded(
          child: ListView.builder(
          itemCount: themeColors.length,
          itemBuilder: (context, index) {
            return themeColors.entries.map((themeColor) {
              final String theme = themeColor.key;
              final Color color = themeColor.value;
              final bool isSelected = (themeColorSelected == theme);
              return RadioListTile(
                title: Text(
                  'This is $theme color',
                  style: TextStyle(color: color, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)
                ),
                subtitle: Text(
                  color.toString().split(': ').elementAt(1),
                  style: TextStyle(color: color.withOpacity(0.6), fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)
                ),
                value: theme,
                groupValue: themeColorSelected,
                activeColor: color,
                onChanged: (value) {
                  ref.read(themeNotifierProvider.notifier).changeColorTheme(theme);
                },
              );
            }).toList()[index];
          },
                ),
        )
      ],
    );
  }
}