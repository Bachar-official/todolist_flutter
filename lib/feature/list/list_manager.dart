import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/item/item_manager.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';

class ListManager {
  final ListHolder holder;
  final ManagerDeps deps;
  final ItemManager itemManager;

  ListManager(
      {required this.deps, required this.holder, required this.itemManager}) {
    getList();
  }

  void getList() {
    holder.setList(deps.repo.getFilteredList(holder.oState.isCompleted));
  }

  void setOnlyCompleted() {
    holder.setOnlyCompleted(!holder.oState.isCompleted);
    getList();
  }

  void goToItemScreen(Todo? todo) async {
    itemManager.setTodo(todo);
    await deps.navKey.currentState!.pushNamed(AppRouter.itemScreen);
    getList();
  }

  void checkTodo(Todo todo) {
    deps.repo.checkTodo(todo.uuid);
    getList();
  }

  void removeTodo(Todo todo) {
    deps.repo.removeTodo(todo.uuid);
    getList();
  }
}
