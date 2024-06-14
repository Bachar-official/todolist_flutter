import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:logger/logger.dart';

class ListState extends ChangeNotifier {
  var logger = Logger();
  List<Todo> todos = [];
  bool onlyCompleted = false;

  void setOnlyCompleted(bool? value) {
    if (value != null) {
      onlyCompleted = value;
      notifyListeners();
      logger.i('Set "only completed" to $value');
    }
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
    logger.i('Removed item number $index');
  }

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
    logger.i('Added item $todo');
  }
}
