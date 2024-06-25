import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/item/item_manager.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';
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
    deps.logger.d('Trying to get todo list');
    try {
      setLoading(true);
      var response = await deps.repo.getTodos();
      checkCondition((condition: response == null, message: 'Ошибка при получении списка задач'));
      holder.setList(response!.todos);
      i(deps)('List loaded successfully');
    } catch(e, s) {
      catchExceptions(e, s, deps);
    } finally {
      setLoading(false);
    }
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
    // deps.repo.checkTodo(todo.id);
    getList();
  }

  void removeTodo(Todo todo) {
    // deps.repo.removeTodo(todo.id);
    getList();
  }
}
