import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';
import 'package:todolist_flutter/feature/item/item_manager.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';
import 'package:todolist_flutter/feature/list/list_manager.dart';
import 'package:todolist_flutter/repository/net_repo.dart';
import 'package:logger/logger.dart';

class DI {
  ManagerDeps deps = (
    navKey: GlobalKey<NavigatorState>(),
    scaffoldKey: GlobalKey<ScaffoldMessengerState>(),
    logger: Logger(),
    repo: NetRepo(dio: Dio()),
  );

  final listHolder = ListHolder();
  late final ListManager listManager;
  final itemHolder = ItemHolder();
  late final ItemManager itemManager;

  DI() {
    itemManager = ItemManager(deps: deps, holder: itemHolder);
    listManager =
        ListManager(deps: deps, holder: listHolder, itemManager: itemManager);
  }

  Future<void> init() async {
    deps.logger.i('DI initialized');
  }
}

final di = DI();
