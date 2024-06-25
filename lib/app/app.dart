import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/constants/themes.dart';
import 'package:todolist_flutter/entity/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Todo List',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru')],
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        scaffoldMessengerKey: di.deps.scaffoldKey,
        navigatorKey: di.deps.navKey,
        debugShowCheckedModeBanner: false,
      );
}
