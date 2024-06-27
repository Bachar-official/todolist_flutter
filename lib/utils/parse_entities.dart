import 'package:todolist_flutter/entity/todo.dart';
import 'dart:convert';

class ParseUtils {
  static Todo parseTodo(Map<String, dynamic> map) => Todo.fromJson(map);
  static List<Todo> parseTodoList(List<dynamic> list) =>
      list.map((el) => Todo.fromJson(el)).toList();
  static List<Todo> parseDbTodoList(List<Map<String, Object?>> list) =>
      list.map((el) => Todo.fromDb(el)).toList();
  static String todoListToJson(List<Todo> todos) => jsonEncode({
        'list': todos.map((todo) => todo.toMap()).toList(),
      });
}
