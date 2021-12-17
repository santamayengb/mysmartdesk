import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysmartdesk/authentication/widgets/signup_form.widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                SizedBox(
                  height: 81,
                  child: SvgPicture.asset('assets/images/logo.svg'),
                ),
                Text(
                  "Create an account",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SignupFormWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
