import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/config/theme/app_theme.dart';
import 'package:flutter_widgets_app/config/router/app_router.dart';
import 'package:flutter_widgets_app/config/theme/provider/theme_provider.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(isDarkModeProvider);
    final String themeColorSelected = ref.watch(themeColorSelectedProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        isDarkMode: isDarkMode,
        themeColorSelected: themeColorSelected
        ).getTheme(),
    );
  }
}
