import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist_flutter/constants/urls.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/utils/get_options.dart';
import 'package:todolist_flutter/utils/parse_entities.dart';

typedef TodoListResponse = ({List<Todo> todos, int revision});
typedef TodoResponse = ({Todo todo, int revision});

class NetRepo {
  final Dio dio;

  const NetRepo({required this.dio});

  Future<bool> hasConnection() async {
    try {
      var response = await dio.get(Urls.baseUrl);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<TodoListResponse> getTodos(int revision) async {
    var response = await dio.get(Urls.listUrl, options: getOptions);
    if (response.statusCode == 200) {
      var array = response.data['list'] as List<dynamic>;
      return (
        todos: await compute(ParseUtils.parseTodoList, array),
        revision: response.data['revision'] as int
      );
    }
    return (todos: <Todo>[], revision: revision);
  }

  Future<TodoListResponse> updateTodoList(
      List<Todo> todos, int revision) async {
    var response = await dio.patch(Urls.listUrl,
        data: ParseUtils.TodoListToJson(todos),
        options: mutateOptions(revision));
    if (response.statusCode == 200) {
      var array = response.data['list'] as List<dynamic>;
      return (
        todos: await compute(ParseUtils.parseTodoList, array),
        revision: response.data['revision'] as int
      );
    }
    return (todos: <Todo>[], revision: revision);
  }

  Future<TodoResponse?> getTodo(String id) async {
    var response = await dio.get(Urls.idUrl(id), options: getOptions);
    if (response.statusCode == 200) {
      var map = response.data['element'] as Map<String, dynamic>;
      return (
        todo: await compute(ParseUtils.parseTodo, map),
        revision: response.data['revision'] as int
      );
    }
    return null;
  }

  Future<TodoResponse?> createTodo(Todo todo, int revision) async {
    var response = await dio.post(Urls.listUrl,
        data: todo.toJson(), options: mutateOptions(revision));
    if (response.statusCode == 200) {
      var map = response.data['element'] as Map<String, dynamic>;
      return (
        todo: await compute(ParseUtils.parseTodo, map),
        revision: response.data['revision'] as int
      );
    }
    return null;
  }

  Future<TodoResponse?> updateTodo(Todo todo, int revision) async {
    var response = await dio.put(Urls.idUrl(todo.id),
        data: todo.toJson(), options: mutateOptions(revision));
    if (response.statusCode == 200) {
      var map = response.data['element'] as Map<String, dynamic>;
      return (
        todo: await compute(ParseUtils.parseTodo, map),
        revision: response.data['revision'] as int
      );
    }
    return null;
  }

  Future<TodoResponse?> deleteTodo(Todo todo, int revision) async {
    var response =
        await dio.delete(Urls.idUrl(todo.id), options: mutateOptions(revision));
    if (response.statusCode == 200) {
      var map = response.data['element'] as Map<String, dynamic>;
      return (
        todo: await compute(ParseUtils.parseTodo, map),
        revision: response.data['revision'] as int
      );
    }
    return null;
  }
}
