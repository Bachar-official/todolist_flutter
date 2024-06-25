import 'package:riverpod/riverpod.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/list/list_state.dart';

class ListHolder extends StateNotifier<ListState> {
  ListHolder() : super(const ListState.initial());

  ListState get oState => state;

  void setList(List<Todo> list) {
    state = state.copyWith(list: list);
  }

  void setOnlyCompleted(bool isCompleted) {
    state = state.copyWith(isCompleted: isCompleted);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
