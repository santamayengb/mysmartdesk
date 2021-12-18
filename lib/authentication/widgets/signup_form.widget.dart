import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/authentication/logic/firebase_authentication.dart/firebase_auth_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mysmartdesk/authentication/logic/saveUser/saveuser_cubit.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailState = GlobalKey<FormFieldState>();
  final passwordState = GlobalKey<FormFieldState>();
  final cPasswordState = GlobalKey<FormFieldState>();

  final _emailController = TextEditingController();

  final _pwdController = TextEditingController();

  final _confirmPwdController = TextEditingController();

  final bool emailFocus = false;
  final bool pwdFocus = false;
  final bool cndPwdFocus = false;

  String pwd = "";
  bool checkBoxValue = false;

  List<String> usertype = ["Admin", "User"];
  String dropdownValue = "User";

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: emailState,
                controller: _emailController,
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
                validator: _emailValidator,
                onChanged: (value) => setState(() {
                  value = pwd;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: passwordState,
                controller: _pwdController,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
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
                validator: _pwdValidator,
                onChanged: (value) {
                  setState(() {
                    pwd = value;
                    log(value);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: cPasswordState,
                obscureText: true,
                controller: _confirmPwdController,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
                  focusedBorder: InputBorder.none,
                  hintText: "Confirm password",
                ),
                validator: _cnfPwdValidator,
              ),
            ),
            DropdownButton<String>(
              dropdownColor: kPrimaryColor,
              isDense: true,
              value: dropdownValue,
              items: usertype.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (value) => setState(() {
                // dropdownValue = value!;
                dropdownValue = value!;
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffFB297B))),
                onPressed: () {
                  final isValid = formKey.currentState?.validate();
                  if (isValid == true) {
                    context
                        .read<FirebaseAuthCubit>()
                        .signup(_emailController.text, _pwdController.text)
                        .whenComplete(() => context.navigateBack());
                  }

                  Map<String, dynamic> userdata = {};

                  if (emailState.currentState?.validate() ?? false) {
                    emailState.currentState?.save();
                    final emailValue = emailState.currentState?.value;
                    userdata["email"] = emailValue;
                  }

                  if (passwordState.currentState?.validate() ?? false) {
                    passwordState.currentState?.save();
                    userdata["password"] = passwordState.currentState?.value;
                  }

                  if (cPasswordState.currentState?.validate() ?? false) {
                    cPasswordState.currentState?.save();
                    userdata["password"] = cPasswordState.currentState?.value;
                  }
                  if (dropdownValue.isNotEmpty) {
                    userdata["type"] = dropdownValue;
                  }

                  context.read<SaveuserCubit>().saveUser(userdata);
                },
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  String? _emailValidator(value) {
    if (value == null || value.isEmpty) {
      return "Email Required";
    }
  }

  String? _pwdValidator(value) {
    int pwdLength = value.toString().length;
    if (value == null || value.isEmpty) {
      return "Password required";
    } else if (pwdLength < 6) {
      return "Mininum lenght should have 6";
    }
  }

  String? _cnfPwdValidator(value) {
    passwordState.currentState?.validate();
    passwordState.currentState?.save();

    final pass = passwordState.currentState?.value;

    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    } else if (value != pass) {
      return "Password mismatch";
    }
  }
}
