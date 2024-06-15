import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/themes.dart';
import 'package:todolist_flutter/feature/list/list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Todo List',
        home: const ListScreen(),
        theme: lightTheme,
        darkTheme: darkTheme,
      );
}
