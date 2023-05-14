import 'dart:ui';

import 'package:jolt/jolt.dart';
export 'package:jolt/src/utils/responsive/edge_insets.dart';

///
extension ResponsiveExtensions on BuildContext {
  ///
  ResponsiveMapping get responsive => ResponsiveMapping(this);

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

///
class ResponsiveMapping {
  ///
  const ResponsiveMapping(this._context);

  ///
  final BuildContext _context;

  ///
  EdgeInsetsResponsive edgeInsets({
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    EdgeInsets? tabletLandscape,
    EdgeInsets? desktop,
    EdgeInsets? tv,
  }) {
    return EdgeInsetsResponsive(
      _context,
      mobile: mobile,
      tablet: tablet,
      tabletLandscape: tabletLandscape,
      desktop: desktop,
      tv: tv,
    );
  }
}
