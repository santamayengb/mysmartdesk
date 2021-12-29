import 'package:flutter/material.dart';

import 'app/app.dart';
import 'bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  bootstrap(
    builder: (router, auth, fireStore) {
      return MyApp(
        appRoute: router,
        auth: auth,
        firebaseFirestore: fireStore,
      );
    },
  );

  // easyLoadingSetup();
  // runApp(MyApp(
  //   auth: FirebaseAuth.instance,
  //   firebaseFirestore: FirebaseFirestore.instance,
  // ));
}

// easyLoadingSetup() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..backgroundColor = Colors.white
//     ..indicatorColor = Colors.black
//     ..maskColor = Colors.black
//     ..userInteractions = false;
// }
