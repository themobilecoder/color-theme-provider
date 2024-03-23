# Color Theme Provider

Use your custom theme **without** relying on `Material Design` or `Cupertino` design tokens.

The `ColorThemeProvider` package lets you define your own color scheme according to your app's needs.

## Features
- Define your own color properties. No need to depend on Google's `ColorScheme` or Apple's `CupertinoThemeData`
- Automatically uses the `theme` parameter when the device is in light mode
- Uses the `darkTheme` parameter when the device is in dark mode
- Properly scoped and accessible within the widget tree

![image caption](screenshots/example-screenshot.png)

## Usage

### Import it

Add the package to your `pubspec.yaml`

```yaml
dependencies:
  
  color_theme_provider:
    git:
      url: https://github.com/themobilecoder/color-theme-provider
      ref: 1.1.0
```


### Defining your own theme

To make your own theme, create a base class that extends or implements the `ColorTheme` abstract class and define your required properties.

For example:

```dart 
import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/material.dart';

abstract class MyTheme implements ColorTheme {
  Color get mainColor;
  Color get containerColor;
  Color get backgroundColor;
  Color get textColor;
}

final class LightMyTheme implements MyTheme {
  @override
  final Color mainColor = const Color(0xFF7BD3EA);

  @override
  final Color containerColor = const Color(0xFFA1EEBD);

  @override
  final Color backgroundColor = const Color(0xFFFCFCFC);

  @override
  final Color textColor = Colors.black;
}

final class DarkMyTheme implements MyTheme {
  @override
  final Color mainColor = const Color(0xFF7BD3EA);

  @override
  final Color containerColor = const Color(0xFF007F73);

  @override
  final Color backgroundColor = const Color(0xFF2C2C2C);

  @override
  final Color textColor = Colors.white;
}
```

### Accessing your theme through `ColorThemeProvider`

The `ColorThemeProvider` uses an `InheritedNotifier` under the hood. This means your custom theme can be accessed if your widgets have the same scope as the theme provider.

```dart
ColorThemeProvider(
    theme: LightMyTheme,
    darkTheme: DarkMyTheme(),
    child: const MyApp(),
),
```

### Using the color theme

If your widgets are under the `ColorThemeProvider` widget tree, you can access your theme through the `context`. You can get the nearest `ColorTheme` using the `BuildContext`'s extension function `colorTheme<T>`.

```dart
final theme = context.colorTheme<MyTheme>();
//Access the properties of your custom theme
theme.mainColor;
theme.backgroundColor;
theme.textColor;
```

### Setting the color theme dynamically

It is possible to change the theme used for light or darkmode while running the app through the `ColorThemeManager`. Obtain this instance using the `BuildContext`.

```dart
  final colorThemeManager = context.colorThemeManager<MyTheme>();

  /// Update current light theme
  colorThemeManager.setTheme(newTheme);

  /// Update current dark theme
  colorThemeManager.setDarkTheme(newTheme);
```

### Checking if platform is in dark mode

Use the `ColorThemeManager` to check whether the platform is in dark mode or not.

```dart
  final colorThemeManager = context.colorThemeManager<MyTheme>();

  /// Check whether app is in light or darkmode
  /// [Brightness.dark] for dark mode and [Brightness.light] for light mode;
  colorThemeManager.getCurrentMode();
```
