import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(value: todo.isCompleted, onChanged: null),
          Expanded(
            child: Column(
              children: [
                Text(todo.title),
                Text(todo.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
