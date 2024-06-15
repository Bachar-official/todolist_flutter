import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          print('start to end');
        }
        if (direction == DismissDirection.endToStart) {
          print('end to start');
        }
      },
      child: Row(
        children: [
          Checkbox(value: todo.isCompleted, onChanged: null),
          Text(todo.description, maxLines: 3, overflow: TextOverflow.ellipsis),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
        ],
      ),
    );
  }
}
