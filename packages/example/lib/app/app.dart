import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'router/router.dart';
import 'theme/theme.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:universal_platform/universal_platform.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Jolt(
      themes: themes,
      builder: (context) {
        return ProviderScope(
          child: MaterialApp.router(
            title: 'Flutter Demo',
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: context.jolt.themeData,
            builder: (context, widget) {
              return Column(
                children: [
                  // TODO review
                  if (UniversalPlatform.isDesktop)
                    SizedBox(
                      height: math.max(MediaQuery.of(context).padding.top, 28),
                      width: double.infinity,
                      child: MoveWindow(
                        child: Container(
                          color: context.color.onPrimaryContainer,
                        ),
                      ),
                    ),
                  Expanded(child: widget ?? const SizedBox()),
                ],
              );
            },
            debugShowCheckedModeBanner: false,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        );
      },
    );
  }
}
