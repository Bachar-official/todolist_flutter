import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/todo.dart';

@immutable
class ItemState {
  final Todo? todo;
  final Importance importance;
  final DateTime? doUntil;

  const ItemState({this.doUntil, required this.importance, this.todo});

  const ItemState.initial()
      : importance = Importance.none,
        doUntil = null,
        todo = null;

  ItemState copyWith({
    Importance? importance,
    DateTime? doUntil,
    bool nullDoUntil = false,
    Todo? todo,
    bool nullTodo = false,
  }) {
    return ItemState(
      importance: importance ?? this.importance,
      doUntil: nullDoUntil == true ? null : doUntil ?? this.doUntil,
      todo: nullTodo == true ? null : todo ?? this.todo,
    );
  }
}
