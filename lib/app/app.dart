import 'package:flutter/material.dart';
import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/constants/themes.dart';
import 'package:todolist_flutter/entity/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Todo List',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        scaffoldMessengerKey: di.deps.scaffoldKey,
        navigatorKey: di.deps.navKey,
        debugShowCheckedModeBanner: false,
      );
}
