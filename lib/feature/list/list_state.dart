import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/todo.dart';

@immutable
class ListState {
  final List<Todo> list;
  final bool isCompleted;
  final bool isLoading;

  const ListState({required this.list, required this.isCompleted, required this.isLoading});

  const ListState.initial()
      : list = const [],
        isCompleted = false, isLoading = false;

  ListState copyWith({List<Todo>? list, bool? isCompleted, bool? isLoading}) {
    return ListState(
      list: list ?? this.list,
      isCompleted: isCompleted ?? this.isCompleted,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
