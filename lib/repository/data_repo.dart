import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/repository/db_repo.dart';
import 'package:todolist_flutter/repository/net_repo.dart';

class DataRepo {
  final NetRepo netRepo;
  final DbRepo dbRepo;

  const DataRepo({required this.netRepo, required this.dbRepo});

  Future<void> initialize() async => await dbRepo.initialize();

  Future<List<Todo>> syncTodos() async {
    var localTodos = await dbRepo.getTodos();
    var localRevision = await dbRepo.getRevision();
    if (await netRepo.hasConnection()) {
      var response = await netRepo.updateTodoList(localTodos, localRevision);
      await dbRepo.addList(response.todos);
      await dbRepo.updateRevision(response.revision);
    }
    return dbRepo.getTodos();
  }

  Future<List<Todo>> getList() async {
    if (await netRepo.hasConnection()) {
      var response = await netRepo.getTodos(await dbRepo.getRevision());
      await dbRepo.addList(response.todos);
      await dbRepo.updateRevision(response.revision);
    }
    return dbRepo.getTodos();
  }

  Future<List<Todo>> inlineUpdateTodo(Todo todo) async {
    if (await netRepo.hasConnection()) {
      var response = await netRepo.updateTodo(todo, await dbRepo.getRevision());
      if (response != null) {
        await dbRepo.updateTodo(response.todo);
        await dbRepo.updateRevision(response.revision);
      }
    } else {
      await dbRepo.updateTodo(todo);
    }
    return dbRepo.getTodos();
  }

  Future<List<Todo>> inlineDeleteTodo(Todo todo) async {
    if (await netRepo.hasConnection()) {
      var response = await netRepo.deleteTodo(todo, await dbRepo.getRevision());
      if (response != null) {
        await dbRepo.deleteTodo(response.todo);
        await dbRepo.updateRevision(response.revision);
      }
    } else {
      await dbRepo.deleteTodo(todo);
    }
    return dbRepo.getTodos();
  }

  Future<int> addTodo(Todo todo) async {
    if (await netRepo.hasConnection()) {
      var response = await netRepo.createTodo(todo, await dbRepo.getRevision());
      if (response != null) {
        await dbRepo.updateRevision(response.revision);
      }
    }
    return dbRepo.createTodo(todo);
  }

  Future<int> updateTodo(Todo todo) async {
    if (await netRepo.hasConnection()) {
      var response = await netRepo.updateTodo(todo, await dbRepo.getRevision());
      if (response != null) {
        await dbRepo.updateRevision(response.revision);
      }
    }
    return dbRepo.updateTodo(todo);
  }

  Future<int> deleteTodo(Todo todo) async {
    if (await netRepo.hasConnection()) {
      var response = await netRepo.deleteTodo(todo, await dbRepo.getRevision());
      if (response != null) {
        await dbRepo.updateRevision(response.revision);
      }
    }
    return dbRepo.deleteTodo(todo);
  }
}
