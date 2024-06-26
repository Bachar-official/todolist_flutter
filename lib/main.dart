import 'package:flutter/material.dart';
import 'package:todolist_flutter/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/entity/di.dart';

void main() {
  di.init();
  runApp(const ProviderScope(child: App()));
}
