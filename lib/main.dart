import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  easyLoadingSetup();
  runApp(MyApp(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  ));
}

easyLoadingSetup() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..maskColor = Colors.black
    ..userInteractions = false;
}
