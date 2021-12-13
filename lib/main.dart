import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  easyLoadingSetup();
  await Firebase.initializeApp();
  runApp(MyApp());
}

easyLoadingSetup() {
  Book.instance
    ..name()
    ..santa();

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..maskColor = Colors.black
    ..userInteractions = false;
}

class Book {
  static const _instance = Book._();

  static Book get instance => _instance;

  void name() {}
  void santa() {}

  const Book._();
}
