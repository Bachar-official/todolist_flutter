import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/utils/parse_entities.dart';

class DbRepo {
  static const _todoTable = 'todo';
  static const _revisionTable = 'revision';
  late final Database _db;

  DbRepo();

  Future<void> initialize() async {
    _db = await openDatabase('todos.db', version: 1, onCreate: (db, version) {
      _db.execute('CREATE TABLE IF NOT EXISTS $_todoTable '
          '(id TEXT PRIMARY KEY, done BOOLEAN NOT NULL CHECK (done IN (0, 1)), '
          'text TEXT, importance TEXT, deadline INTEGER, createdAt INTEGER, '
          'updatedAt INTEGER, lastUpdatedBy TEXT, color TEXT)');
      _db.execute('CREATE TABLE IF NOT EXISTS $_revisionTable '
          '(id INTEGER PRIMARY KEY, revision INTEGER)');
      _db.execute('INSERT INTO $_revisionTable (id, revision) VALUES (1, 0)');
    });
  }

  Future<void> addList(List<Todo> todos) async {
    await _db.transaction((txn) async {
      for (var todo in todos) {
        await txn.insert(_todoTable, todo.toDb(),
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }
    });
  }

  Future<List<Todo>> getTodos() async {
    var list = await _db.query(_todoTable);
    return compute(ParseUtils.parseDbTodoList, list);
  }

  Future<int> createTodo(Todo todo) async {
    return await _db.insert(_todoTable, todo.toDb());
  }

  Future<int> updateTodo(Todo todo) async {
    return await _db
        .update(_todoTable, todo.toDb(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(Todo todo) async {
    return await _db.delete(_todoTable, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> getRevision() async {
    var list = await _db.query(_revisionTable);
    return list.first['revision'] as int;
  }

  Future<void> updateRevision(int revision) async {
    await _db.update(_revisionTable, {'revision': revision}, where: 'id = 1');
  }
}
