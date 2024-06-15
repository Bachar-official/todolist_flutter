import 'package:flutter/material.dart';
import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/constants/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Todo List',
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
      );
}
