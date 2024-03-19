library color_theme_provider;

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

interface class ColorThemeManager<T extends ColorTheme> {
  /// Sets the light theme with type [T]. Note that if your device is in dark mode,
  /// using [setTheme] will not do anything until your device is switched
  /// to light mode.
  void setTheme(T theme) {}

  /// Sets the light theme with type [T]. Note that if your device is in dark mode,
  /// using [setTheme] will not do anything until your device is switched
  /// to light mode.
  void setDarkTheme(T theme) {}
}

/// Theme class used with [ColorThemeProvider].
abstract class ColorTheme {}

/// [ColorThemeProvider] allows you to obtain an instance of your custom theme
/// that extends [ColorTheme]. Everything under the [ColorThemeProvider] widget tree
/// should be able to access the current theme.
///
/// This also automatically handles changes between light and dark mode
/// using [theme] and [darkTheme] arguments respectively.
// ignore: must_be_immutable
class ColorThemeProvider<T extends ColorTheme>
    extends InheritedNotifier<ValueNotifier<T>>
    with WidgetsBindingObserver
    implements ColorThemeManager<T> {
  ColorThemeProvider({
    super.key,
    required this.theme,
    required this.darkTheme,
    required super.child,
  }) : super(
          notifier: ValueNotifier(_isDarkMode() ? darkTheme : theme),
        ) {
    WidgetsBinding.instance.addObserver(this);
  }

  T theme;
  T darkTheme;

  /// Sets the light theme with type [T]. Note that if your device is in dark mode,
  /// using [setTheme] will not do anything until your device is switched
  /// to light mode.
  @override
  void setTheme(T colorTheme) {
    theme = colorTheme;
    notifier?.value = theme;
  }

  /// Sets the light theme with type [T]. Note that if your device is in dark mode,
  /// using [setTheme] will not do anything until your device is switched
  /// to light mode.
  @override
  void setDarkTheme(T colorTheme) {
    darkTheme = colorTheme;
    notifier?.value = darkTheme;
  }

  @override
  void didChangePlatformBrightness() {
    notifier!.value = (_isDarkMode()) ? darkTheme : theme;
    super.didChangePlatformBrightness();
  }

  @override
  bool updateShouldNotify(covariant ColorThemeProvider<T> oldWidget) {
    return oldWidget.theme != theme || oldWidget.darkTheme != darkTheme;
  }

  static T _themeOf<T extends ColorTheme>(BuildContext context) {
    final T? result = _maybeThemeOf<T>(context);
    assert(result != null, 'No ColorTheme found!');
    return result!;
  }

  static T? _maybeThemeOf<T extends ColorTheme>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ColorThemeProvider<T>>()
        ?.notifier
        ?.value;
  }

  static ColorThemeProvider<T> _of<T extends ColorTheme>(BuildContext context) {
    final ColorThemeProvider<T>? themeProvider =
        context.dependOnInheritedWidgetOfExactType<ColorThemeProvider<T>>();
    assert(themeProvider != null,
        'No ColorThemeProvider found. Make sure you defined the type <T> when obtaining a ColorThemeProvider');
    return themeProvider!;
  }

  static bool _isDarkMode() {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    } catch (e) {
      log('WindgetsBinding not yet initialised');
      return false;
    }
  }
}

extension ColorThemeProviderUtils on BuildContext {
  /// Obtain a [ColorTheme] from the closest parent in the widget tree.
  /// This throws an [AssertionError] if there is no [ColorThemeProvider]
  /// parent of type [T] in the widget tree.
  T theme<T extends ColorTheme>() {
    return ColorThemeProvider._themeOf<T>(this);
  }

  /// Obtain a [ColorThemeManager] from the closest parent in the widget tree.
  /// This throws an [AssertionError] if there is no [ColorThemeProvider]
  /// parent of type [T] in the widget tree.
  ColorThemeManager<ColorTheme> colorThemeManager<T extends ColorTheme>() {
    return ColorThemeProvider._of<T>(this);
  }
}
