import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/authentication/logic/firebase_authentication.dart/firebase_auth_cubit.dart';
import 'package:auto_route/auto_route.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _pwdController = TextEditingController();

  final _confirmPwdController = TextEditingController();

  final bool emailFocus = false;
  final bool pwdFocus = false;
  final bool cndPwdFocus = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: emailFocus,
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
                onChanged: (value) => emailFocus == true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: pwdFocus,
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
                onChanged: (value) => pwdFocus == true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: cndPwdFocus,
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
                onTap: () {
                  setState(() {
                    cndPwdFocus == true;
                  });
                },
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
                  final isValid = formKey.currentState?.validate();
                  if (isValid == true) {
                    context
                        .read<FirebaseAuthCubit>()
                        .signup(_emailController.text, _pwdController.text)
                        .whenComplete(() => context.navigateBack());
                  }
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

  String? _emailValidator(value) {
    if (value == null || value.isEmpty) {
      return "Email Required";
    }
  }

  String? _pwdValidator(value) {
    if (value == null || value.isEmpty) {
      return "Password required";
    }
  }

  String? _cnfPwdValidator(value) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    } else if (value != _pwdController.text) {
      return "Password mismatch";
    }
  }
}
