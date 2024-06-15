import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:logger/logger.dart';
import 'package:todolist_flutter/repository/todo_repo.dart';

class ListState extends ChangeNotifier {
  bool onlyCompleted = false;
  var logger = Logger();

  List<Todo> get list => repo.getFilteredList(onlyCompleted);

  void setOnlyCompleted(bool? value) {
    if (value != null) {
      onlyCompleted = value;
      notifyListeners();
      logger.i('Set "only completed" to $value');
    }
  }

  void removeTodo(int index) {
    repo.removeTodo(index);
    notifyListeners();
    logger.i('Removed item number $index');
  }

  void addTodo(Todo todo) {
    repo.addTodo(todo);
    notifyListeners();
    logger.i('Added item $todo');
  }
}
