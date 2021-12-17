import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';

class SignupFormWidget extends StatelessWidget {
  SignupFormWidget({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
          ),
        ),
        TextButton(onPressed: () {}, child: const Text("Sign up"))
      ],
    ));
  }
}
