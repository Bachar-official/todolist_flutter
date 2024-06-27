import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/snackbar_reason.dart';

void showSnackbar(SnackbarReason reason, String message, ManagerDeps deps) {
  if (deps.scaffoldKey.currentContext != null &&
      deps.scaffoldKey.currentContext!.mounted) {
    deps.scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: reason.getSnackbarColor(),
        content: Text(message),
      ),
    );
  }
}
