import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/palette.dart';

class IconLabelButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const IconLabelButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color getButtonColor() {
      var brightness = Theme.of(context).brightness;
      if (brightness == Brightness.dark && onPressed != null) {
        return DarkPalette.red;
      }
      if (brightness == Brightness.dark && onPressed == null) {
        return DarkPalette.labelDisable;
      }
      if (brightness == Brightness.light && onPressed != null) {
        return LightPalette.red;
      } else {
        return LightPalette.labelDisable;
      }
    }

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(getButtonColor()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.delete, color: getButtonColor()),
          Text(
            label,
            style: TextStyle(color: getButtonColor()),
          ),
        ],
      ),
    );
  }
}
