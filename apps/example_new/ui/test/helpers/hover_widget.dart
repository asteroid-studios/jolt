import 'package:alchemist/alchemist.dart' as alchemist;
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';

alchemist.Interaction hover(Finder finder) => (WidgetTester tester) async {
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(finder));
      await tester.pumpAndSettle();
      return null;
    };
