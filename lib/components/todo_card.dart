import 'package:flutter/material.dart';
import 'package:todolist_flutter/components/todo_checkbox.dart';
import 'package:todolist_flutter/entity/todo.dart';

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
    return Dismissible(
      direction: DismissDirection.horizontal,
      key: ValueKey<String>(todo.uuid),
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
                    Text(todo.description,
                        maxLines: 3, overflow: TextOverflow.ellipsis),
                    Visibility(
                      visible: todo.doUntil != null,
                      child: Text(todo.doUntil.toString()),
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
    );
  }
}
