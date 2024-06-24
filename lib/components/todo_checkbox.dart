import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/palette.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/todo.dart';

class TodoCheckbox extends StatelessWidget {
  final Todo todo;
  const TodoCheckbox({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    Color? getCheckboxColor() {
      if (brightness == Brightness.dark) {
        if (todo.done) {
          return DarkPalette.green;
        }
        if (todo.importance == Importance.important) {
          return DarkPalette.redOpacity;
        }
        return null;
      } else {
        if (todo.done) {
          return LightPalette.green;
        }
        if (todo.importance == Importance.important) {
          return LightPalette.redOpacity;
        }
      }
      return null;
    }

    Color getCheckboxBorderColor() {
      if (brightness == Brightness.dark) {
        if (todo.done) {
          return DarkPalette.green;
        }
        if (todo.importance == Importance.important) {
          return DarkPalette.red;
        }
        return DarkPalette.suportSeparator;
      } else {
        if (todo.done) {
          return LightPalette.green;
        }
        if (todo.importance == Importance.important) {
          return LightPalette.red;
        }
        return LightPalette.suportSeparator;
      }
    }

    return Checkbox(
      fillColor: WidgetStateProperty.all(getCheckboxColor()),
      side: WidgetStateBorderSide.resolveWith(
          (state) => BorderSide(color: getCheckboxBorderColor())),
      value: todo.done,
      onChanged: (_) {},
    );
  }
}
