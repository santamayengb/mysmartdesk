import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/logic/firebase_authentication.dart/firebase_auth_cubit.dart';
import 'package:mysmartdesk/authentication/widgets/widgets.dart';

import '../../router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  _validate() {
    formkey.currentState!.validate();
  }

  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<FirebaseAuthCubit, FirebaseAuthState>(
        listener: (context, state) {
          switch (state.status) {
            case UserStatus.initial:
              EasyLoading.show(status: 'Signing...');
              break;
            case UserStatus.loading:
              EasyLoading.show(status: 'PLease wait');
              break;

            case UserStatus.loaded:
              EasyLoading.dismiss();
              context.router.push(const DashboardRoute());
              break;

            case UserStatus.error:
              EasyLoading.showError("Signing failed",
                  dismissOnTap: true, duration: const Duration(seconds: 5));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: SizedBox(
                    height: 81,
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      EmailWidget(emailController: emailController),
                      PasswordWidget(pwdController: pwdController),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 50)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffFB297B))),
                      onPressed: () async {
                        _validate();
                        await context
                            .read<FirebaseAuthCubit>()
                            .signin(emailController.text, pwdController.text);
                      },
                      child: const Text("LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: GestureDetector(
                    onTap: () => context.router.push(SignUpRoute()),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: "click here to"),
                          TextSpan(
                              text: " sign up",
                              style: TextStyle(color: kPrimaryColor)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 


// class ExampleView extends StatelessWidget {
//   const ExampleView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExampleViewListner(child: Container());
//   }
// }

// class ExampleViewListner extends StatelessWidget {
//   const ExampleViewListner({Key? key, required this.child}) : super(key: key);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<FirebaseAuthCubit, FirebaseAuthState>(
//           listener: _firebaseAuthCubitListner,
//         ),
//       ],
//       child: child,
//     );
//   }

//   void _firebaseAuthCubitListner(
//       BuildContext context, FirebaseAuthState state) {}
// }
