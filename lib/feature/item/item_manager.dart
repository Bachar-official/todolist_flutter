import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';
import 'package:todolist_flutter/utils/catch_exceptions.dart';
import 'package:todolist_flutter/utils/logging.dart';

class ItemManager {
  final ManagerDeps deps;
  final ItemHolder holder;

  ItemManager({required this.deps, required this.holder});

  final TextEditingController descriptionC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setLoading(bool isLoading) => holder.setIsLoading(isLoading);

  void setTodo(Todo? todo) {
    if (todo != null) {
      holder.setTodo(todo);
      descriptionC.text = todo.text;
      holder.setDeadline(todo.deadline);
      holder.setImportance(todo.importance);
    } else {
      holder.setTodo(null);
      _clearForm();
    }
  }

  void setImportance(Importance? importance) {
    if (importance == null) {
      holder.setImportance(Importance.basic);
    } else {
      holder.setImportance(importance);
    }
  }

  void setDoUntil(DateTime? doUntil) {
    holder.setDeadline(doUntil);
  }

  void _clearForm() {
    descriptionC.clear();
    holder.setTodo(null);
    holder.setDeadline(null);
    holder.setImportance(Importance.basic);
  }

  Future<void> save() async {
    setLoading(true);
    try {
      if (formKey.currentState!.validate()) {
        if (holder.oState.todo != null) {
          d(deps)('Trying to update todo ${holder.oState.todo!.id}');
          Todo newTodo = holder.oState.todo!.copyWith(
            text: descriptionC.text,
            importance: holder.oState.importance,
            deadline: holder.oState.deadline,
            nullDeadline: holder.oState.deadline == null,
          );
          await deps.repo.updateTodo(newTodo);
          i(deps)('Todo updated!');
        } else {
          Todo newTodo = Todo.initial(
            crDone: false,
            crText: descriptionC.text,
            crImportance: holder.oState.importance,
            crDeadline: holder.oState.deadline,
          );
          d(deps)('Trying to create new todo ${newTodo.id}');
          await deps.repo.addTodo(newTodo);
          i(deps)('Todo created!');
        }
        _clearForm();
        goBack();
      }
    } catch (e, s) {
      catchExceptions(e, s, deps);
    } finally {
      setLoading(false);
    }
  }

  void goBack() {
    deps.navKey.currentState!.pop();
  }

  Future<void> remove() async {
    setLoading(true);
    d(deps)('Trying to delete todo ${holder.oState.todo!.id}');
    try {
      await deps.repo.deleteTodo(holder.oState.todo!);
      i(deps)('Todo ${holder.oState.todo!.id} deleted!');
      _clearForm();
      goBack();
    } catch (e, s) {
      catchExceptions(e, s, deps);
    } finally {
      setLoading(false);
    }
  }
}
