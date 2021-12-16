import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/logic/firebase_authentication.dart/firebase_auth_cubit.dart';
import 'package:mysmartdesk/router/app_router.gr.dart';
import '../widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create an account",
                  style: Theme.of(context).textTheme.headline5,
                ),
                EmailWidget(
                  emailController: _emailController,
                ),
                PasswordWidget(pwdController: _pwdController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 50)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffFB297B))),
                      onPressed: () async {
                        context
                            .read<FirebaseAuthCubit>()
                            .signup(_emailController.text, _pwdController.text)
                            .whenComplete(() =>
                                context.router.navigate(const AuthFlow()));
                      },
                      child: const Text("SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                          ))),
                ),
                IconButton(
                    onPressed: () => context.router.navigate(const AuthFlow()),
                    icon: const Icon(Icons.ac_unit_outlined))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
