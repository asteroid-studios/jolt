///
class BreakpointsData {
  ///
  const BreakpointsData({
    this.wearable = const Wearable(),
    this.mobile = const Mobile(),
    this.tablet = const Tablet(),
    this.laptop = const Laptop(),
    this.desktop = const Desktop(),
    this.tv = const Tv(),
  });

  /// The wearable breakpoint
  final Wearable wearable;

  /// The mobile breakpoint
  final Mobile mobile;

  /// The tablet breakpoint
  final Tablet tablet;

  /// The tablet landscape breakpoint
  final Laptop laptop;

  /// The desktop breakpoint
  final Desktop desktop;

  /// The tv breakpoint
  final Tv tv;

  /// Return all breakpoints
  List<Breakpoint> get breakpoints => [
        wearable,
        mobile,
        tablet,
        laptop,
        desktop,
        tv,
      ];
}

///
sealed class Breakpoint {
  ///
  const Breakpoint({
    required this.name,
    required this.maxWidth,
  });

  ///
  final String name;

  ///
  final double maxWidth;

  /// Less than operator
  bool operator <(Breakpoint other) => maxWidth < other.maxWidth;

  /// Less than or equal operator
  bool operator <=(Breakpoint other) => maxWidth <= other.maxWidth;

  /// Greater than operator
  bool operator >(Breakpoint other) => maxWidth > other.maxWidth;

  /// Greater than or equal operator
  bool operator >=(Breakpoint other) => maxWidth >= other.maxWidth;
}

///
class Wearable extends Breakpoint {
  ///
  const Wearable({super.maxWidth = 280}) : super(name: 'Wearable');
}

///
class Mobile extends Breakpoint {
  ///
  const Mobile({super.maxWidth = 600}) : super(name: 'Mobile');
}

///
class Tablet extends Breakpoint {
  ///
  const Tablet({super.maxWidth = 900}) : super(name: 'Tablet');
}

///
class Laptop extends Breakpoint {
  ///
  const Laptop({super.maxWidth = 1600}) : super(name: 'Laptop');
}

///
class Desktop extends Breakpoint {
  ///
  const Desktop({super.maxWidth = 2000}) : super(name: 'Desktop');
}

///
class Tv extends Breakpoint {
  ///
  const Tv({super.maxWidth = double.infinity}) : super(name: 'Tv');
}
