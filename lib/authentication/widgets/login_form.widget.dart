import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/authentication/logic/firebase_authentication.dart/firebase_auth_cubit.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    Key? key,
    required this.emailController,
    required this.pwdController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController pwdController;

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final formkey = GlobalKey<FormState>();

  // bool _validate() {
  //   return formkey.currentState!.validate();
  // }

  final emailcontroller = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.mail_rounded,
                  color: kPrimaryColor,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
                focusedBorder: InputBorder.none,
                hintText: "Email",
              ),
              validator: _validateEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pwdController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
                focusedBorder: InputBorder.none,
                hintText: "password",
              ),
              validator: _validatePassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: TextButton(
              onLongPress: () => context
                  .read<FirebaseAuthCubit>()
                  .signin("test@test.com", "123456789"),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 50)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffFB297B))),
              onPressed: () => _onPressLoginButton(context),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter email";
    }
    return null;
  }

  _onPressLoginButton(BuildContext context) {
    final isValid = formkey.currentState?.validate() ?? false;

    if (isValid) {
      log(isValid.toString());
      context
          .read<FirebaseAuthCubit>()
          .signin(emailcontroller.text, pwdController.text);
    } else {
      log(isValid.toString());
    }
  }
}
