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
    git: https://github.com/themobilecoder/color-theme-provider
    ref: 1.0.0
```


### Defining your own theme

To make your own theme, create a class that extends the `ColorTheme` abstract class and define the properties that you require. 

For example:

```dart 
import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/material.dart';

class MyTheme extends ColorTheme {
  MyTheme({
    required this.mainColor,
    required this.containerColor,
    required this.backgroundColor,
    required this.textColor,
  });

  final Color mainColor;
  final Color containerColor;
  final Color backgroundColor;
  final Color textColor;
}

final lightTheme = MyTheme(
  mainColor: const Color(0xFF7BD3EA),
  containerColor: const Color(0xFFA1EEBD),
  backgroundColor: const Color(0xFFFCFCFC),
  textColor: Colors.black,
);

final darkTheme = MyTheme(
  mainColor: const Color(0xFF7BD3EA),
  containerColor: const Color(0xFF007F73),
  backgroundColor: const Color(0xFF2C2C2C),
  textColor: Colors.white,
);
```

### Accessing your theme through `ColorThemeProvider`

The `ColorThemeProvider` uses an `InheritedNotifier` under the hood. This means that your custom theme can be accessed as long as your widgets has the same scope as the theme provider.

```dart
ColorThemeProvider(
    theme: lightTheme,
    darkTheme: darkTheme,
    child: const MyApp(),
),
```

### Using the theme

If your widgets are under the `ColorThemeProvider` widget tree, you can access your theme through the `context`.

```dart
final theme = context.theme<MyTheme>();
//Access the properties of your custom theme
theme.mainColor;
theme.backgroundColor;
theme.textColor;
```
