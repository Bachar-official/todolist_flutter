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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(value: todo.isCompleted, onChanged: null),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(todo.description,
                      maxLines: 3, overflow: TextOverflow.ellipsis),
                  Text('дата'),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
          ],
        ),
      ),
    );
  }
}
