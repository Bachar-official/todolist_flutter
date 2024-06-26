import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/todo.dart';

@immutable
class ListState {
  final List<Todo> list;
  final bool isCompleted;

  const ListState({required this.list, required this.isCompleted});

  const ListState.initial()
      : list = const [],
        isCompleted = false;

  ListState copyWith({List<Todo>? list, bool? isCompleted}) {
    return ListState(
      list: list ?? this.list,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
