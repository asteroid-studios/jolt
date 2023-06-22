---
sidebar_position: 3
title: 'Extension Syntax'
---

Jolt does not lean too heavily in to extension based syntax right now. That being said you can do things like set a default text style or default surface color very easily.

``` dart
Button(label: 'Test')
.textBody()
.surfacePrimary(),
```