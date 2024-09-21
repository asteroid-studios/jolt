import 'package:ui/ui.dart';

///
extension SymbolsX on Widget {
  ///
  SymbolStyles get style => SymbolStyles(this);
}

///
class SymbolStyles {
  ///
  const SymbolStyles(this._widget);

  final Widget _widget;

  ///
  Widget get heroLg => DefaultSymbolStyle(style: Fonts.hero.lg, child: _widget);

  ///
  Widget get hero => DefaultSymbolStyle(style: Fonts.hero, child: _widget);

  ///
  Widget get heroSm => DefaultSymbolStyle(style: Fonts.hero.sm, child: _widget);

  ///
  Widget get displayLg => DefaultSymbolStyle(style: Fonts.display.lg, child: _widget);

  ///
  Widget get display => DefaultSymbolStyle(style: Fonts.display, child: _widget);

  ///
  Widget get displaySm => DefaultSymbolStyle(style: Fonts.display.sm, child: _widget);

  ///
  Widget get headingLg => DefaultSymbolStyle(style: Fonts.heading.lg, child: _widget);

  ///
  Widget get heading => DefaultSymbolStyle(style: Fonts.heading, child: _widget);

  ///
  Widget get headingSm => DefaultSymbolStyle(style: Fonts.heading.sm, child: _widget);

  ///
  Widget get bodySm => DefaultSymbolStyle(style: Fonts.body.sm, child: _widget);

  ///
  Widget get body => DefaultSymbolStyle(style: Fonts.body, child: _widget);

  ///
  Widget get bodyLg => DefaultSymbolStyle(style: Fonts.body.lg, child: _widget);

  ///
  Widget get labelLg => DefaultSymbolStyle(style: Fonts.label.lg, child: _widget);

  ///
  Widget get label => DefaultSymbolStyle(style: Fonts.label, child: _widget);

  ///
  Widget get labelSm => DefaultSymbolStyle(style: Fonts.label.sm, child: _widget);
}
