import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/logic/authflow/authflow_cubit.dart';
import 'package:mysmartdesk/router/app_router.gr.dart';

import 'package:mysmartdesk/router/router.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authFlowCubit = context.watch<AuthflowCubit>();
    return AutoRouter.declarative(
      routes: (context) {
        switch (authFlowCubit.state.status) {
          case AuthFlowStatus.loggedIn:
            return [DashboardRoute()];
          case AuthFlowStatus.loggedOut:
            return [const LoginRoute()];
          case AuthFlowStatus.initial:
            return [const SplashScreenRoute()];
        }
      },
    );
  }
}
