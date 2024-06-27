import 'package:dio/dio.dart';
import 'package:todolist_flutter/constants/token.dart';

Options getOptions = Options(headers: {'Authorization': token});
Options mutateOptions(int revision) => Options(
    headers: {'Authorization': token, 'X-Last-Known-Revision': revision});
