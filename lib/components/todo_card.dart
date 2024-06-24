import 'package:flutter/material.dart';
import 'package:todolist_flutter/components/todo_checkbox.dart';
import 'package:todolist_flutter/constants/palette.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/utils/readable_date.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final void Function(Todo) onGoToItemScreen;
  final void Function(Todo) onCheckTodo;
  final void Function(Todo) onRemoveTodo;
  const TodoCard(
      {super.key,
      required this.todo,
      required this.onGoToItemScreen,
      required this.onCheckTodo,
      required this.onRemoveTodo});

  @override
  Widget build(BuildContext context) {
    var bright = Theme.of(context).brightness;

    TextStyle? getDescriptionStyle() {
      return todo.done
          ? TextStyle(
              color: bright == Brightness.dark
                  ? DarkPalette.labelTertiary
                  : LightPalette.labelTertiary,
              decoration: TextDecoration.lineThrough,
            )
          : null;
    }

    TextStyle getDateStyle() {
      return TextStyle(
          color: bright == Brightness.dark
              ? DarkPalette.labelTertiary
              : LightPalette.labelTertiary);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Dismissible(
          direction: todo.done
              ? DismissDirection.endToStart
              : DismissDirection.horizontal,
          key: ValueKey<String>(todo.id),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              onRemoveTodo(todo);
            } else {
              onCheckTodo(todo);
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              onCheckTodo(todo);
              return false;
            } else {
              return true;
            }
          },
          secondaryBackground: const ColoredBox(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.delete),
              ),
            ),
          ),
          background: const ColoredBox(
            color: Colors.green,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.check),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TodoCheckbox(todo: todo),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            todo.importance.getIcon(),
                            Text(
                              todo.text,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: getDescriptionStyle(),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: todo.deadline != null,
                          child: Text(
                            getReadableDate(todo.deadline),
                            style: getDateStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                    onPressed: () => onGoToItemScreen(todo),
                    icon: const Icon(Icons.info_outline)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
