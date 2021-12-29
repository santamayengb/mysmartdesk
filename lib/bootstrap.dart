import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'router/app_router.gr.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

typedef BootStrapBuilder = FutureOr<Widget> Function(
  // add new Type here, which is to be passed at App
  AppRouter router,
  FirebaseAuth auth,
  FirebaseFirestore fireStore,
);

Future<void> bootstrap({required BootStrapBuilder builder}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final _appRouter = AppRouter();
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder(_appRouter, auth, fireStore)),
        blocObserver: AppBlocObserver(),
      );
      await Firebase.initializeApp();
      easyLoadingSetup();
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

easyLoadingSetup() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..maskColor = Colors.black
    ..userInteractions = false;
}
