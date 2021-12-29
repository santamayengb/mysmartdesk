import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysmartdesk/core/lottie/assets.dart';
import 'package:mysmartdesk/router/app_router.gr.dart';
import 'package:mysmartdesk/router/router.dart';

import 'login_form.widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
    required this.emailController,
    required this.pwdController,
    required this.userData,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController pwdController;
  final CollectionReference<Map<String, dynamic>> userData;

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: SizedBox(
                height: 81,
                child: SvgPicture.asset(Assets.image.logoSvg),
              ),
            ),
            LoginFormWidget(
                emailController: emailController, pwdController: pwdController),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: GestureDetector(
                onTap: () => context.router.push(const SignUpRoute()),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: "click here to"),
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
    );
  }
}
