---
sidebar_position: 2
title: 'Getting Started'
---

import CodeBlock from "@theme/CodeBlock";
import {joltVersion} from "../src/versions";

# Getting Started

## Quickstart

If you are creating a new project with Jolt, consider using Mason CLI to quickly spin up a default JoltApp.

Check out the [quickstart](/developer_experience/quickstart) page to see all available quickstart options! 




## Installation

```sh title="Terminal"
flutter pub add jolt
```

or

<CodeBlock title="lib/pubspec.yaml" language="yaml">{joltVersion}</CodeBlock>

### Add JoltApp

If you already have a MaterialApp or CupertinoApp, you should replace it with a JoltApp.

You can also pass your **themes** and **widgetTheme** at this point, which we will get into in the next section.


``` dart title="main.dart"

void main() async {

  // Make sure to initialise Jolt
  await Jolt.initFlutter();

  runApp(
    JoltApp(
      themes: themes,
      widgetTheme: widgetTheme,
    );
  );

  // You can also use JoltApp.router if using routing
  runApp(
    JoltApp.router(
      themes: themes,
      widgetTheme: widgetTheme,
      routerConfig: _appRouter.config(),
    );
  );
}

```