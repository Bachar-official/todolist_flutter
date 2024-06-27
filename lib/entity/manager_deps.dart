import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/repository/data_repo.dart';

typedef ManagerDeps = ({
  Logger logger,
  GlobalKey<ScaffoldMessengerState> scaffoldKey,
  GlobalKey<NavigatorState> navKey,
  DataRepo repo,
});
