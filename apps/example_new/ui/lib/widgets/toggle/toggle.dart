import 'package:ui/ui.dart';

///
class Toggle extends StatefulWidget {
  ///
  const Toggle({
    required this.onChanged,
    this.label,
    this.icon,
    this.initialValue = false,
    this.type = ToggleType.ghost,
    super.key,
  });

  ///
  final bool initialValue;

  ///
  final void Function(bool) onChanged;

  ///
  final ToggleType type;

  ///
  final Widget? label;

  ///
  final Widget? icon;

  @override
  State<Toggle> createState() => ToggleState();
}

class ToggleState extends State<Toggle> {
  late bool selected;

  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO add the inline style etc and resolve
    final style = ToggleStyle.defaultStyle(context, this);

    return Button(
      style: (context, button) {
        final buttonStyle = ToggleStyle.fromType(widget.type);
        return buttonStyle.call(context, button)?.merge(style.buttonStyle);
      },
      // TODO lower opacity when not selected but also hovered.
      label: widget.label != null ? Opacity(opacity: 1, child: widget.label) : null,
      icon: widget.icon != null ? Opacity(opacity: 1, child: widget.icon) : null,
      selected: selected,
      onTap: () => setState(() => selected = !selected),
    );
  }
}
