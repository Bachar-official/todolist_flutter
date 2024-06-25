import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/utils/parse_entities.dart';

class DbRepo {
  static const _todoTable = 'todo';
  static const _revisionTable = 'revision';
  late final Database _db;

  DbRepo() {
    openDatabase('todos.db', version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE IF NOT EXISTS $_todoTable '
          '(id TEXT PRIMARY KEY, done BOOLEAN NOT NULL CHECK (done IN (0, 1)), '
          'text TEXT, importance TEXT, deadline INTEGER, createdAt INTEGER, '
          'updatedAt INTEGER, lastUpdatedBy TEXT, color TEXT)');
      db.execute('CREATE TABLE IF NOT EXISTS $_revisionTable '
          '(id INTEGER PRIMARY KEY, revision INTEGER)');
      db.execute('INSERT INTO $_revisionTable (id, revision) VALUES (1, 0)');
    }).then((db) => _db = db);
  }

  Future<List<Todo>> getTodos() async {
    var list = await _db.query('SELECT * FROM todo');
    return compute(ParseUtils.parseDbTodoList, list);
  }

  Future<void> addTodo(Todo todo) async {
    await _db.insert(_todoTable, todo.toMap());
  }

  Future<void> updateTodo(Todo todo) async {
    await _db.update(_todoTable, todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<void> deleteTodo(Todo todo) async {
    await _db.delete(_todoTable, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> getRevision() async {
    var list = await _db.query('SELECT * FROM $_revisionTable');
    return list.first['revision'] as int;
  }

  Future<void> updateRevision(int revision) async {
    await _db.update(_revisionTable, {'revision': revision}, where: 'id = 1');
  }
}
