import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:logger/logger.dart';

class TodoRepo {
  final List<Todo> todos = [
    ...List<Todo>.generate(
        50,
        ((i) => Todo(
            description: 'Task $i',
            isCompleted: false,
            importance: Importance.none,
            doUntil: null))),
  ];
  final Logger logger = Logger();

  void addTodo(Todo todo) {
    todos.add(todo);
    logger.i('Added item $todo');
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    logger.i('Removed item number $index');
  }

  void editTodo(int index, Todo todo) {
    todos[index] = todo;
    logger.i('Edited item number $index');
  }

  void checkTodo(int index) {
    Todo todo = todos[index];
    todo = todo.copyWith(isCompleted: true);
    todos[index] = todo;
    logger.i('Checked item number $index');
  }

  List<Todo> getFilteredList(bool isCompleted) {
    logger.i('Only completed: $isCompleted');
    return todos.where((todo) => todo.isCompleted == isCompleted).toList();
  }
}

final repo = TodoRepo();
