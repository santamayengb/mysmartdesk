import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/logic/authflow/authflow_cubit.dart';
import 'package:mysmartdesk/authentication/logic/firebase_authentication.dart/firebase_auth_cubit.dart';
import 'package:mysmartdesk/dashboard/logic/card/card_cubit.dart';

class MultiProvider extends StatelessWidget {
  const MultiProvider(
      {Key? key,
      required this.child,
      required this.auth,
      required this.firebaseFirestore})
      : super(key: key);

  final Widget child;
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FirebaseAuthCubit()),
        BlocProvider(
          create: (context) => AuthflowCubit(auth),
        ),
        BlocProvider(
          create: (context) => CardCubit(firebaseFirestore),
        )
      ],
      child: child,
    );
  }
}
