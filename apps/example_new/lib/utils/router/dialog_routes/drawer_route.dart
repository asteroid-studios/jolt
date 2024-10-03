import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

class AutoRouteDrawerRoute extends CustomRoute {
  AutoRouteDrawerRoute({
    required super.page,
    super.path,
    super.meta,
    super.usesPathAsKey,
    bool disableBarrier = false,
  }) : super(
          customRouteBuilder: <T>(BuildContext context, Widget child, AutoRoutePage<T> page) =>
              _DrawerRoute(page, disableBarrier: disableBarrier),
        );
}

class _DrawerRoute<T> extends PageRoute<T> with DrawerRoute {
  _DrawerRoute(
    AutoRoutePage<T> page, {
    required this.disableBarrier,
  }) : super(settings: page);

  @override
  final bool disableBarrier;

  AutoRoutePage<T> get _page => settings as AutoRoutePage<T>;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      _page.buildPage(context);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      transitionBuilder(
        context,
        animation,
        secondaryAnimation,
        child,
      );

  @override
  DrawerAlignment get alignment => DrawerAlignment.right;

  @override
  double? get crossAxisSize => 450;
}
