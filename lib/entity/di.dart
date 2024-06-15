import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';
import 'package:todolist_flutter/feature/item/item_manager.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';
import 'package:todolist_flutter/feature/list/list_manager.dart';
import 'package:todolist_flutter/repository/todo_repo.dart';
import 'package:logger/logger.dart';

class DI {
  ManagerDeps deps = (
    navKey: GlobalKey<NavigatorState>(),
    scaffoldKey: GlobalKey<ScaffoldMessengerState>(),
    logger: Logger(),
    repo: TodoRepo(),
  );

  final listHolder = ListHolder();
  late final ListManager listManager;
  final itemHolder = ItemHolder();
  late final ItemManager itemManager;

  DI() {
    listManager = ListManager(deps: deps, holder: listHolder);
    itemManager = ItemManager(deps: deps, holder: itemHolder);
  }
}

final di = DI();
