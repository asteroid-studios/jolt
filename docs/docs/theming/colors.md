---
sidebar_position: 2
title: 'Colors'
---

## ColorScheme

Every **ThemeData** requires a single **ColorScheme**. ColorSchemes must be either light or dark, you can create one like this:

``` dart
final colorSchemeLight = ColorScheme.light(
  neutral: Colors.slate,
  primary: Colors.violet,
  secondary: Colors.emerald,
  tertiary: Colors.black,
);
```

There are a lot more options that can be overridden such as background, surface and semantic colors (success, error, warning, info). You can have as much or as little control over the colorScheme as you like.

If you only provide a neutralColor, like the example above, background and surface will be inferred. You can also specify a theme as highContrast, which will change the background and surface slightly.

## JoltColor

Something very important about the **ColorScheme** above is that it expects all colors to be of type **JoltColor**.

JoltColor extends the ColorSwatch class with a few extra handy properties. You can define a JoltColor like so:

```dart
const slate = JoltColor(
  // The default value
  0xff475569,
  // Foreground (ie, text on top of this color)
  foreground: Color(0xfff1f5f9),
  // Full shade list
  shade50: Color(0xfff8fafc),
  shade100: Color(0xfff1f5f9),
  shade200: Color(0xffe2e8f0),
  shade300: Color(0xffcbd5e1),
  shade400: Color(0xff94a3b8),
  shade500: Color(0xFF64748b),
  shade600: Color(0xff475569),
  shade700: Color(0xff334155),
  shade800: Color(0xff1e293b),
  shade900: Color(0xff0f172a),
  shade950: Color(0xff020617),
  // Colors for interaction state
  onHover: Color(0xff334155),
  onFocus: Color(0xff334155),
  onDisabled: Color(0xff334155),
  onDrag: Color(0xff334155),
);
```

The default color, foreground and all shades are required parameters, but you can optionally omit the interaction colors.
If you omit these colors, Jolt will try to guess sensible values.

## Colors

Similar to Material, Jolt has a Colors class for convenience. Rather than reinvent the wheel, we have supplied the beautiful colors used over at [TailwindCSS](https://tailwindcss.com/docs/customizing-colors) as a default.

<!-- TODO update this list, or alternatively provide a link to the demo app. -->
``` dart
final colors = [
  Colors.transparent,
  Colors.black,
  Colors.white,
  Colors.slate,
  Colors.stone,
  Colors.violet,
  Colors.emerald,
];
```