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
        if (todo.isCompleted) {
          return DarkPalette.green;
        }
        if (todo.importance == Importance.high) {
          return DarkPalette.redOpacity;
        }
        return null;
      } else {
        if (todo.isCompleted) {
          return LightPalette.green;
        }
        if (todo.importance == Importance.high) {
          return LightPalette.redOpacity;
        }
      }
      return null;
    }

    Color getCheckboxBorderColor() {
      if (brightness == Brightness.dark) {
        if (todo.isCompleted) {
          return DarkPalette.green;
        }
        if (todo.importance == Importance.high) {
          return DarkPalette.red;
        }
        return Colors.pink;
      } else {
        if (todo.isCompleted) {
          return LightPalette.green;
        }
        if (todo.importance == Importance.high) {
          return LightPalette.red;
        }
      }
      return Colors.pink;
    }

    return Checkbox(
      fillColor: WidgetStateProperty.all(getCheckboxColor()),
      value: todo.isCompleted,
      onChanged: (_) {},
    );
  }
}
