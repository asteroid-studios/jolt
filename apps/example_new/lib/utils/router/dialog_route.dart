import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

class AutoRouteDialogRoute extends CustomRoute {
  AutoRouteDialogRoute({
    required super.page,
    super.path,
    super.meta,
    super.usesPathAsKey,
  }) : super(customRouteBuilder: _DialogRoute.new);
}

class _DialogRoute<T> extends PageRoute<T> with DialogRoute {
  _DialogRoute(
    BuildContext context, // ignore: avoid_unused_constructor_parameters
    Widget child, // ignore: avoid_unused_constructor_parameters
    AutoRoutePage<T> page,
  ) : super(settings: page);

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
}
