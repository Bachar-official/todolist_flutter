import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/todo.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';
import 'package:todolist_flutter/utils/check_conditions.dart';
import 'package:uuid/v4.dart';

class ItemManager {
  final ManagerDeps deps;
  final ItemHolder holder;

  ItemManager({required this.deps, required this.holder});

  final TextEditingController descriptionC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setTodo(Todo? todo) {
    if (todo != null) {
      holder.setTodo(todo);
      descriptionC.text = todo.text;
      holder.setDoUntil(todo.deadline);
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
    holder.setDoUntil(doUntil);
  }

  void _clearForm() {
    descriptionC.clear();
    holder.setTodo(null);
    holder.setDoUntil(null);
    holder.setImportance(Importance.basic);
  }

  void save() {
    if (formKey.currentState!.validate()) {
      // if (holder.oState.todo != null) {
      //   Todo newTodo = holder.oState.todo!.copyWith(
      //     description: descriptionC.text,
      //     importance: holder.oState.importance,
      //     doUntil: holder.oState.doUntil,
      //     nullDoUntil: holder.oState.doUntil == null,
      //   );
      //   print('New: $newTodo');
      //   deps.repo.editTodo(newTodo);
      // } else {
      //   deps.repo.addTodo(Todo(
      //       id: const UuidV4().generate(),
      //       text: descriptionC.text,
      //       done: false,
      //       importance: holder.oState.importance,
      //       deadline: holder.oState.doUntil));
      // }
      _clearForm();
      goBack();
    }
  }

  void goBack() async {
    deps.navKey.currentState!.pop();
  }

  void remove() {
    // deps.repo.removeTodo(holder.oState.todo!.id);
    _clearForm();
    goBack();
  }
}
