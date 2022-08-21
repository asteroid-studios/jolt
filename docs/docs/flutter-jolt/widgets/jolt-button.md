---
sidebar_position: 2
---

# JoltButton

## What problem does it solve?

The standard buttons available through Flutter are:
- [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)
- [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
- [OutlinedButton](https://api.flutter.dev/flutter/material/OutlinedButton-class.html)
- [IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html)

Each of these buttons have different parameters available and each one must be styled separately in the **ThemeData** for your app. They are extremely customisable, but make you do a lot of work yourself.

As an example, if you wanted to create a basic button with an icon and label, you would need to define your own Row for those items and them style them yourself as needed.

``` dart
ElevatedButton(
    onPressed: () {},
    child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(Icons.check_circle_outline_outlined),
            SizedBox(width: 8),
            Text('Mark as complete'),
        ],
    ),
),
```

## How does JoltButton differ?

JoltButton goes for a **one-size-fits-all** approach. It makes assumptions about common button practices then lets you add customisation as needed.

### Extras
- If you onPressed is a Future, the button will automatically show a loading state.
- The button prevents repressing while processing Futures by default.
- Easy styling including changing the size of the button.
- ThemeExtension called **JoltButtonThemeData**, to enable Theme wide configuration just like the standard Flutter buttons.

### Basic usage

``` dart
// highlight-next-line
// Icon and label
JoltButton(
    onPressed: () {},
    label: 'Mark as complete',
    icon: Icons.check_circle_outline_outlined,
),
// highlight-next-line
// Icon only
JoltButton(
    onPressed: () {},
    icon: Icons.menu,
),
// highlight-next-line
// Label only
JoltButton(
    onPressed: () {},
    label: 'Get started',
),
```

## Theme wide styling

To setup default styling across your app for JoltButton, add JoltButtonThemeData to your Jolt themeExtensions.

``` dart
Jolt(
      themes: themes,
      themeExtensions: (themeData) {
        final color = themeData.colorScheme;
        return [
            JoltButtonThemeData(
                borderRadius: 5,
                circularIconButtons: true,
                backgroundColor: context.color.primary,
            ),
        ];
      },
      builder: (context) {
        ...
```

## Individual button styling


### How it normally goes
When using the standard Flutter buttons, you need to use a **MaterialStateProperty** for things like **backgroundColor** and **textStyle**. Once again, great for ultimate customisation but impractical for most use cases. Most times the easy option is to just use the `MaterialStateProperty.all()` to quickly force a color or style, or using something like `ElevatedButton.styleFrom`.

``` dart
// It ends up looking like this:
ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
        backgroundColor:  MaterialStateProperty.all(
            context.color.primary,
        ),
        foregroundColor: MaterialStateProperty.all(
            context.color.onPrimary,
        ),
    ),
    child: Text('Styled button'),
),
// Or this
ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        primary: context.color.primary,
        onPrimary: context.color.onPrimary,
    ),
    child: Text('Styled button'),
),
```

### Using JoltButton
Styling a JoltButton is easy, you have access to all these properties and more:
- backgroundColor
- foregroundColor
- borderColor
- outline
- textStyle
- iconSize

In fact, if you use a color from the ColorScheme for backgroundColor, you don't even need to set the foreground as the button will find the matching color. For Example:

``` dart
JoltButton(
    onPressed: () {},
    label: 'Styled button',
    backgroundColor: context.color.primary,
    // will automatically set foreground to onPrimary
),
```

The other cool feature, is that you can change the size of the whole button (including the icon) by changing the textStyle property. For example:

``` dart
JoltButton(
    onPressed: () {},
    label: 'Small button',
    icon: Icons.check_circle,
    textStyle: context.textStyle.labelSmall,
),
JoltButton(
    onPressed: () {},
    label: 'Regular button',
    icon: Icons.check_circle,
),
JoltButton(
    onPressed: () {},
    label: 'Large button',
    icon: Icons.check_circle,
    textStyle: context.textStyle.headlineSmall,
),
```

:::tip Syntax for colors and text styles

If you are looking at the syntax of context.color and context.textStyle and you are not familiar, they are extensions setup by Jolt to easily access properties from the default ColorScheme and TextTheme respectively. [Read More](../theming.md)

:::
