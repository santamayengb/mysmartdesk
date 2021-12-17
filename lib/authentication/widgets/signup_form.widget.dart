import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:auto_route/auto_route.dart';

class SignupFormWidget extends StatelessWidget {
  SignupFormWidget({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                validator: _emailValidate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                validator: _pwdValidate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                validator: _cnfPwdValidate,
              ),
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
                  final d = formKey.currentState?.validate();
                  log(d.toString());
                },
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  String? _emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
  }

  String? _pwdValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Passowrd required";
    }
    return value;
  }

  String? _cnfPwdValidate(String? value) {
    if (value == _pwdValidate.toString()) {
      log(_pwdValidate.toString());
    }
  }
}
