import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysmartdesk/app/widget/multi_provider.dart';

import 'package:mysmartdesk/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp.router(
        routeInformationParser: _appRoute.defaultRouteParser(),
        routerDelegate: _appRoute.delegate(),
        debugShowCheckedModeBanner: false,
        title: 'SmartDesk',
        theme: ThemeData.dark(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
