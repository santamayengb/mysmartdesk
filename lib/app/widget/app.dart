import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:mysmartdesk/app/widget/multi_provider.dart';
import 'package:mysmartdesk/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.auth,
    required this.firebaseFirestore,
    required this.appRoute,
  }) : super(key: key);

  final AppRouter appRoute;
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      auth: auth,
      firebaseFirestore: firebaseFirestore,
      child: MaterialApp.router(
        routeInformationParser: appRoute.defaultRouteParser(),
        routerDelegate: appRoute.delegate(),
        debugShowCheckedModeBanner: false,
        title: 'SmartDesk',
        theme: ThemeData.dark(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
