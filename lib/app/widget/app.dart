import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysmartdesk/app/widget/multi_provider.dart';

import 'package:mysmartdesk/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.auth, required this.database})
      : super(key: key);

  final _appRoute = AppRouter();
  final FirebaseAuth auth;
  final FirebaseDatabase database;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      auth: auth,
      database: database,
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
