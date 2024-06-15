import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';

class ListManager {
  final ListHolder holder;
  final ManagerDeps deps;

  ListManager({required this.deps, required this.holder});

  void getList() {
    holder.setList(deps.repo.getFilteredList(holder.oState.isCompleted));
  }

  Future<void> goToItemScreen() async {
    await deps.navKey.currentState!.pushNamed(AppRouter.itemScreen);
  }
}
