import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/item/item_state.dart';

class ItemHolder extends StateNotifier<ItemState> {
  ItemHolder() : super(const ItemState.initial());

  ItemState get oState => state;

  void setTodo(Todo? todo) {
    if (todo == null) {
      state = state.copyWith(nullTodo: true, todo: null);
    } else {
      state = state.copyWith(todo: todo);
    }
  }

  void setImportance(Importance importance) {
    state = state.copyWith(importance: importance);
  }

  void setDeadline(DateTime? doUntil) {
    if (doUntil == null) {
      state = state.copyWith(nullDeadline: true, deadline: null);
    } else {
      state = state.copyWith(deadline: doUntil, nullDeadline: false);
    }
  }

  void setIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
