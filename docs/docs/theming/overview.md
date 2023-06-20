---
sidebar_position: 1
title: 'Themes'
---

# Themes

## ThemeData

When styling Material in Flutter, ThemeData contains the styling data for the whole app and all it's widgets as well.

In Jolt, theming for the widgets is separate, so the ThemeData class is a little lighter. Most apps will have at least a light and dark theme, so your final implementation might look like this:

``` dart
final themes = [
  ThemeData(
    id: 'light',
    colorScheme: colorSchemeLight,
    dimensions: dimensions,
    typography: typography,
  ),
  ThemeData(
    id: 'dark',
    colorScheme: colorSchemeDark,
    dimensions: dimensions,
    typography: typography,
  ),
];
```

Next we will break down each of these properties so you can see what kind of options are available.


