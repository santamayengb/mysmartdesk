import 'package:flutter/material.dart';

import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
    required this.pwdController,
  }) : super(key: key);

  final TextEditingController pwdController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
      ),
    );
  }
}
