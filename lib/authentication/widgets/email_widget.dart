import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: emailController,
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
        validator: (value) {
          if (value!.isEmpty) {
            return "Email is required";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
