import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist_flutter/constants/urls.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/utils/get_options.dart';
import 'package:todolist_flutter/utils/parse_entities.dart';

class NetRepo {
  final Dio dio;

  const NetRepo({required this.dio});

  Future<({List<Todo> todos, int revision})?> getTodos() async {
    var response = await dio.get(Urls.listUrl, options: getOptions);
    if (response.statusCode == 200) {
      var array = response.data['list'] as List<dynamic>;
      return (todos: await compute(ParseUtils.parseTodoList, array), revision: response.data['revision'] as int);
    }
    return null;
  }

  Future<({Todo todo, int revision})?> getTodo(String id) async {
    var response = await dio.get(Urls.idUrl(id), options: getOptions);
    if (response.statusCode == 200) {
      var map = response.data['element'] as Map<String, dynamic>;
      return (todo: await compute(ParseUtils.parseTodo, map), revision: response.data['revision'] as int);
    }
    return null;
  }
}
