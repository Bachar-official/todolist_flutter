import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';

class ItemManager {
  final ManagerDeps deps;
  final ItemHolder holder;

  ItemManager({required this.deps, required this.holder});

  final TextEditingController descriptionC = TextEditingController();
}
