import 'package:todolist_flutter/entity/todo.dart';
import 'package:logger/logger.dart';

class TodoRepo {
  final List<Todo> todos = [];
  final Logger logger = Logger();

  void addTodo(Todo todo) {
    todos.add(todo);
    logger.i('Added item $todo');
  }

  void removeTodo(String uuid) {
    todos.removeWhere((todo) => todo.uuid == uuid);
    logger.i('Removed item with uuid $uuid');
  }

  void editTodo(Todo todo) {
    todo = todo.copyWith(isCompleted: false);
    int index = todos.indexWhere((t) => t.uuid == todo.uuid);
    todos[index] = todo;
    logger.i('Edited item number $index');
  }

  void checkTodo(String uuid) {
    int index = todos.indexWhere((t) => t.uuid == uuid);
    Todo todo = todos[index];
    todo = todo.copyWith(isCompleted: true);
    todos[index] = todo;
    logger.i('Checked item $todo');
  }

  List<Todo> getFilteredList(bool isCompleted) {
    logger.i('Only completed: $isCompleted');
    if (!isCompleted) {
      return todos;
    }
    return todos.where((todo) => todo.isCompleted == isCompleted).toList();
  }
}

final repo = TodoRepo();
