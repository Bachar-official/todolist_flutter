import 'package:flutter/material.dart';
import 'package:todolist_flutter/feature/list/list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Todo List',
        home: ListScreen(),
      );
}
