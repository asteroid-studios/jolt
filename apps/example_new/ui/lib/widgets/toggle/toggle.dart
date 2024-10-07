import 'package:ui/ui.dart';

///
class Toggle extends StatefulWidget {
  ///
  const Toggle({
    required this.onChanged,
    this.label,
    this.icon,
    this.style,
    this.expanded = false,
    this.initialValue = false,
    this.type = ToggleType.filled,
    super.key,
  });

  ///
  final bool initialValue;

  ///
  final void Function(bool) onChanged;

  ///
  final ToggleType type;

  ///
  final StyleResolver<ToggleStyle, ToggleState>? style;

  ///
  final Widget? label;

  ///
  final Widget? icon;

  ///
  final bool expanded;

  @override
  State<Toggle> createState() => ToggleState();
}

///
class ToggleState extends State<Toggle> {
  ///
  late bool selected;

  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO add the inline style etc and resolve
    final preStyle = ToggleStyle.defaultStyle(context, this).resolve(context, widget.style?.call(context, this));
    final style = preStyle.resolver?.call(preStyle, context) ?? preStyle;

    return Button(
      expanded: widget.expanded,
      style: (context, button) {
        final buttonStyle = ToggleStyle.fromType(widget.type);
        return buttonStyle.call(context, button)?.merge(style.buttonStyle);
      },
      label: widget.label,
      icon: widget.icon,
      onTap: () {
        setState(() => selected = !selected);
        widget.onChanged.call(selected);
      },
    );
  }
}
