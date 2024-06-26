import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/item/item_manager.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';
import 'package:todolist_flutter/repository/db_repo.dart';
import 'package:todolist_flutter/utils/catch_exceptions.dart';
import 'package:todolist_flutter/utils/check_conditions.dart';
import 'package:todolist_flutter/utils/logging.dart';

class ListManager {
  final ListHolder holder;
  final ManagerDeps deps;
  final ItemManager itemManager;

  ListManager(
      {required this.deps, required this.holder, required this.itemManager});
  void setLoading(bool isLoading) => holder.setLoading(isLoading);

  Future<void> getList() async {
    d(deps)('Trying to get todo list');
    try {
      setLoading(true);
      var list = await deps.repo.getList();
      holder.setList(list);
      i(deps)('Fetched list with ${list.length} items');
    } catch (e, s) {
      catchExceptions(e, s, deps);
    } finally {
      setLoading(false);
    }
  }

  void setOnlyCompleted() {
    holder.setOnlyCompleted(!holder.oState.isCompleted);
  }

  void goToItemScreen(Todo? todo) async {
    setLoading(true);
    itemManager.setTodo(todo);
    await deps.navKey.currentState!.pushNamed(AppRouter.itemScreen);
    await getList();
  }

  Future<void> checkTodo(Todo todo) async {
    Todo checkedTodo = todo.copyWith(done: true);
    d(deps)('Try to check todo ${todo.id}');
    setLoading(true);
    try {
      var newList = await deps.repo.inlineUpdateTodo(checkedTodo);
      i(deps)('Todo ${todo.id} checked successfully');
      holder.setList(newList);
    } catch (e, s) {
      catchExceptions(e, s, deps);
    } finally {
      setLoading(false);
    }
  }

  Future<void> removeTodo(Todo todo) async {
    d(deps)('Try to remove todo ${todo.id}');
    setLoading(true);
    try {
      var newList = await deps.repo.inlineDeleteTodo(todo);
      i(deps)('Todo ${todo.id} removed successfully');
      holder.setList(newList);
    } catch (e, s) {
      catchExceptions(e, s, deps);
    } finally {
      setLoading(false);
    }
    getList();
  }
}
