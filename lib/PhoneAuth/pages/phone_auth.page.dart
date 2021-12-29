import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/core/lottie/assets.dart';
import 'package:mysmartdesk/router/app_router.gr.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth'),
      ),
      body: Center(
        child: Column(
          children: [
            LottieBuilder.asset(
              Assets.lottie.phoneAuth,
              height: 300,
              reverse: true,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hoverColor: kPrimaryColor),
                keyboardType: TextInputType.phone,
                onSaved: (newValue) => context.router
                    .push(OtpVerificationRoute(number: "+919501179924")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
