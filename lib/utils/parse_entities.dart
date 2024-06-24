import 'package:todolist_flutter/entity/todo.dart';

class ParseUtils {
  static Todo parseTodo(Map<String, dynamic> map) => Todo.fromJson(map);
  static List<Todo> parseTodoList(List<dynamic> list) => list.map((el) => Todo.fromJson(el)).toList();
}