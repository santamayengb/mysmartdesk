import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysmartdesk/app/widget/multi_provider.dart';

import 'package:mysmartdesk/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.auth}) : super(key: key);

  final _appRoute = AppRouter();
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      auth: auth,
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
