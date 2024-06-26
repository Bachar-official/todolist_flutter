import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/todo.dart';

@immutable
class ItemState {
  final Todo? todo;
  final Importance importance;
  final DateTime? deadline;
  final bool isLoading;

  const ItemState(
      {this.deadline,
      required this.importance,
      this.todo,
      required this.isLoading});

  const ItemState.initial()
      : importance = Importance.basic,
        deadline = null,
        todo = null,
        isLoading = false;

  ItemState copyWith({
    Importance? importance,
    DateTime? deadline,
    bool nullDeadline = false,
    Todo? todo,
    bool nullTodo = false,
    bool? isLoading,
  }) {
    return ItemState(
      isLoading: isLoading ?? this.isLoading,
      importance: importance ?? this.importance,
      deadline: nullDeadline ? null : deadline ?? this.deadline,
      todo: nullTodo ? null : todo ?? this.todo,
    );
  }
}
