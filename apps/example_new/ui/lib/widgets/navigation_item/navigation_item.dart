import 'package:ui/ui.dart';

///
class NavigationItem extends StatefulWidget {
  ///
  const NavigationItem({
    required this.onTap,
    required this.active,
    required this.label,
    this.collapsed = true,
    this.icon,
    this.children = const [],
    super.key,
  });

  ///
  final Widget? icon;

  ///
  final Widget label;

  ///
  final void Function() onTap;

  ///
  final List<Widget> children;

  ///
  final bool collapsed;

  ///
  final bool active;

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  late bool collapsed;

  @override
  void initState() {
    collapsed = widget.collapsed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          horizontalPadding: Spacing.sm,
          color: widget.active ? Colors.primary.withOpacity(0.3) : null,
          style: !widget.active ? Button.ghost : null,
          mainAxisAlignment: MainAxisAlignment.start,
          icon: widget.icon,
          label: Expanded(child: widget.label),
          trailing: widget.children.isNotEmpty
              ? Button(
                  icon: collapsed ? Icons.caretRight.icon : Icons.caretDown.icon,
                  size: Fonts.label.fontSize,
                  padding: Spacing.xxs,
                  color: Colors.transparent,
                  onTap: () => setState(() => collapsed = !collapsed),
                )
              : null,
          onTap: () {
            if (!widget.active) {
              setState(() {
                collapsed = false;
              });
            } else {
              setState(() {
                collapsed = !collapsed;
              });
            }
            widget.onTap();
          },
        ),
        if (widget.children.isNotEmpty)
          Collapsible(
            animationDuration: const Duration(milliseconds: 200),
            collapsed: collapsed,
            child: Container(
              margin: EdgeInsets.only(top: Spacing.xs, left: Spacing.sm),
              padding: EdgeInsets.only(left: Spacing.sm),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.outline,
                    width: 2,
                  ),
                ),
              ),
              child: Column(children: widget.children),
            ),
          ),
      ],
    );
  }
}
