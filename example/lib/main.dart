import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ColorThemeProvider(
      theme: LightMyTheme(),
      darkTheme: DarkMyTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colorTheme<MyTheme>();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 72.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Color Theme Demo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48.0,
                  height: 1.1,
                  wordSpacing: 0.9,
                  fontWeight: FontWeight.w700,
                  color: theme.textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
              ),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: theme.containerColor,
                    borderRadius: BorderRadius.circular(24.0)),
                child: Center(
                  child: Text(
                    'Container color',
                    style: TextStyle(
                      color: theme.textColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
              ),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: theme.mainColor,
                    borderRadius: BorderRadius.circular(24.0)),
                child: Center(
                  child: Text(
                    'Main color',
                    style: TextStyle(
                      color: theme.textColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
              ),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(24.0)),
                child: Center(
                  child: Text(
                    'Background color',
                    style: TextStyle(
                      color: theme.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void changeTheme(BuildContext context, MyTheme newTheme) {
  final colorThemeManager = context.colorThemeManager<MyTheme>();

  /// Update current light theme
  colorThemeManager.setTheme(newTheme);

  /// Update current dark theme
  colorThemeManager.setDarkTheme(newTheme);

  /// Check whether app is in light or darkmode
  /// [Brightness.dark] for dark mode and [Brightness.light] for light mode;
  colorThemeManager.getCurrentMode();
}
