## 1.1.1

* Update readme

## 1.1.0

**BREAKING CHANGE**
* The `context.theme<T>()` is **deprecated**. Instead, use `context.colorTheme<T>()` to get the theme.
* Use `context.themeManager<T>()` to get theme manager of type `ColorTheme`

## 1.0.0

* Add `ColorThemeProvider` to initialize the theme
* Use `context.theme<T>()` to get theme of type `ColorTheme`
* Use `context.themeManager<T>()` to get theme manager of type `ColorTheme`
