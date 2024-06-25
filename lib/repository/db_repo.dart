import 'package:sqflite/sqflite.dart';
import 'package:todolist_flutter/entity/todo.dart';

class DbRepo {
  late final Database _db;

  DbRepo() {
    openDatabase('todos.db', version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE IF NOT EXISTS todo '
      '(id TEXT PRIMARY KEY, done BOOLEAN NOT NULL CHECK (done IN (0, 1)), '
      'text TEXT, importance TEXT, deadline INTEGER, createdAt INTEGER, '
      'updatedAt INTEGER, lastUpdatedBy TEXT, color TEXT)');
    }).then((db) => _db = db);
  }

  Future<List<Todo>> getTodos() async {
    var list = await _db.query('SELECT * FROM todo');
    print(list);
    return list.map((el) => Todo.fromDb(el)).toList();
  }

  Future<void> addTodo(Todo todo) async {
    await _db.insert('todo', todo.toMap());
  }
}