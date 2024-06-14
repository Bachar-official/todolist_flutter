import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/app/app.dart';
import 'package:todolist_flutter/feature/list/list_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ListState()),
      ],
      child: const App(),
    ),
  );
}
