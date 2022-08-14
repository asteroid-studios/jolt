---
sidebar_position: 1
---

# Getting Started

## Packages
<!-- TODO Replace with pub.dev links -->
| pub.dev | description | 
| ------- | ----------- | 
| [**flutter_jolt**](/docs/category/flutter-jolt/) | Wraps MaterialApp/CupertinoApp, for theming, utilities and more. | 
| [**flutter_jolt_ui**](/docs/category/flutter_jolt_ui) | Provides additional widgets using Jolt styling | 


## Installation

``` yaml
environment:
  sdk: ">=2.17.5 <3.0.0"
  flutter: ">=3.0.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_jolt:
  // highlight-next-line
  # Optionally install the UI package as well
  // highlight-next-line
  # flutter_jolt_ui:

```

## Setup

``` dart
import 'package:flutter_jolt/flutter_jolt_init.dart';

void main() {
  // highlight-next-line
  // Initialize Jolt in your main function
  await initializeJolt();

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // highlight-next-line
    // Wrap your app with the Jolt widget
    return Jolt(
      builder: (context) {
        return MaterialApp(
          scaffoldMessengerKey: joltScaffoldMessengerKey,
          // highlight-next-line
          // Pass the Jolt theme into your app
          theme: context.jolt.themeData,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

```







