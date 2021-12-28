import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
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
                  height: 80,
                  child: SvgPicture.asset('assets/images/logo.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Create an account",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const SignupFormWidget(),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kPrimaryColor),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.send_to_mobile,
                          color: Colors.white,
                        ),
                        Text(
                          "Sign up with Phone Number",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: GestureDetector(
                    onTap: () => context.navigateBack(),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: "Already have an account"),
                          TextSpan(
                              text: " Click here",
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
