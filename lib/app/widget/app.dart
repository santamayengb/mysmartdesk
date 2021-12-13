import 'package:flutter/material.dart';

import 'package:mysmartdesk/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRoute.defaultRouteParser(),
      routerDelegate: _appRoute.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'SmartDesk',
      theme: ThemeData.dark(),
    );
  }
}
