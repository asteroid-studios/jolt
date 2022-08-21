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

For example, if you just want a standard looking button with a label and an icon, you need all this code:

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

Here are a few examples of JoltButton configurations:

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

## Styling individual buttons


### How it is normally
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



``` dart
JoltButton(
    onPressed: () {},
    label: 'Styled button',
    textStyle
    backgroundColor: context.color.primary,
    // highlight-start
    // Foreground color is assumed when using a color
    // from ColorScheme, so the line below isn't needed:
    // highlight-end
    // color: context.color.onPrimary
),
```



## Doc Outline:
1. Talk through current options with Pictures?
1. Explain why they are a bit of a pain
1. Show off JoltButton, show how it satisfies each of the options above
1. Show how to theme the JoltButton using theme extensions
1. Talk about how to do different size buttons