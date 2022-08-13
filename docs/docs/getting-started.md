---
sidebar_position: 1
---

# Getting Started

## Why Jolt?

### Doesn't reinvent the wheel

Many packages that allow managing themes, typography and other styling, insist that you use their custom made classes and patterns.

Jolt utilizes MaterialApp/CupertinoApp and all the built in functionality that goes with it. The base Jolt widget is just an inherited widget that goes around your app, providing extra functionality.

```dart 
Jolt(
  builder: (context) {
    return MaterialApp( 
      scaffoldMessengerKey: joltScaffoldMessengerKey,
      theme: context.jolt.themeData,
    );
  }
),
```

### Easy to understand extensions

Jolt includes many extensions, most available straight from the BuildContext. They are structured in a way that is easy to use and read.

- All colors from the default Flutter ColorScheme are available via context.color, as well as Jolt's extended semantic colors.
- All text styles from the default Flutter TextTheme are available via context.textStyle.
- There are many more extensions available, find out more in the Flutter Jolt section of the docs.


```dart 
Text(
  'Lorem Ipsum',
  style: context.textStyle.displayLarge.copyWith(
    color: context.color.primary,
  ),
),
```

### Theme management

Use Jolt to manage the active theme for the user. Setting the theme with Jolt with save the selected value to the device using Hive.

If you have multiple light and dark themes, Jolt is smart enough to know that a light theme with primary color x, should be swapped for a dark theme with primary color x, and visa versa.

### Extended Semantic Colors

Flutter's semantic colors only include a color for **'error'** by default. Jolt adds colors for **'success'**, **'warning'** and **'info'**.

<!-- TODO talk about snackbars -->
### Extended Snackbar
- semantic snackbars
- snackbars with icons
- convenient extensions



### Text Scaling

By default Flutter will read a device's text size settings and adjust text widgets accordingly.
Jolt adds an optional layer on top of this, allowing the text scale to be adjusted inside the app as well.

The calculation for font size then looks like:

`MediaQuery.of(context).textScaleFactor * context.jolt.textScale.value * text font size (eg: 20)`

To use the combined textScale, use the JoltText widget (which has a bunch of extra functionality as well).

There are also rare cases where you don't want text widgets to scale their text, JoltText allows turning off scaling all together.

### Widgets

Aside from the functionality listed above, Jolt also provides some useful widgets:
- JoltText
- JoltGrid










