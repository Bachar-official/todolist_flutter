import 'package:dio/dio.dart';
import 'package:todolist_flutter/entity/condition_exception.dart';
import 'package:todolist_flutter/entity/manager_deps.dart';
import 'package:todolist_flutter/entity/snackbar_reason.dart';
import 'package:todolist_flutter/utils/logging.dart';
import 'package:todolist_flutter/utils/show_snackbar.dart';

void catchExceptions(Object exception, StackTrace stackTrace, ManagerDeps deps) {
  if (exception is DioException) {
    e(deps)(exception.message, stackTrace: stackTrace);
    showSnackbar(SnackbarReason.error, 'Ошибка сети: ${exception.message}', deps);
  } else if (exception is ConditionException) {
    w(deps)(exception.message, stackTrace: stackTrace);
    showSnackbar(SnackbarReason.warning, exception.message, deps);
  } else {
    e(deps)(exception, stackTrace: stackTrace);
    showSnackbar(SnackbarReason.error, 'Ошибка: $exception', deps);
  }
}