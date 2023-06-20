import 'dart:ui';

import 'package:jolt/jolt.dart';

///
extension ResponsiveExtensions on BuildContext {
  ///
  // ResponsiveMapping get responsive => ResponsiveMapping(this);

  T responsive<T>({
    required T mobile,
    T? tablet,
    T? tabletLandscape,
    T? desktop,
    T? tv,
  }) {
    final width = mediaQuery.size.width;
    // Add some basic breakpoints
    if (width < 600) return mobile;
    if (width < 900) return tablet ?? mobile;
    if (width < 1600) return tabletLandscape ?? tablet ?? mobile;
    if (width < 2000) return desktop ?? tabletLandscape ?? tablet ?? mobile;
    return tv ?? desktop ?? tabletLandscape ?? tablet ?? mobile;
    //   switch (_context.view) {
    //     case FlutterView.mobile:
    //       return mobile;
    //     case FlutterView.tablet:
    //       return tablet ?? mobile;
    //     case FlutterView.tabletLandscape:
    //       return tabletLandscape ?? tablet ?? mobile;
    //     case FlutterView.desktop:
    //       return desktop ?? tablet ?? mobile;
    //     case FlutterView.tv:
    //       return tv ?? desktop ?? tablet ?? mobile;
    //   }
  }

  ///
  ViewMapping get view => ViewMapping(this);

  FlutterView get _view => View.of(this);

  ///
  Rect? get globalPaintBounds {
    final renderObject = findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

///
class ViewMapping {
  ///
  const ViewMapping(this._context);

  ///
  final BuildContext _context;
}
