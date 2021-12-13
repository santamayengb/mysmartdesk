import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/logic/cubit/firebase_auth_cubit.dart';

class MultiProvider extends StatelessWidget {
  const MultiProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FirebaseAuthCubit()),
      ],
      child: child,
    );
  }
}
