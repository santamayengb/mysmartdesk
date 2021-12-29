import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/core/lottie/assets.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final number = TextEditingController();

  bool ifSent = false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
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
                maxLength: 10,
                controller: number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            //     PinCodeTextField(
            //   appContext: context,
            //   length: 6,
            //   onChanged: (value) {
            //     _auth.verifyPhoneNumber(
            //       phoneNumber: number,
            //       verificationCompleted: (phoneAuthCredential) => log("Successful"),
            //       verificationFailed: (error) => log("failed"),
            //       codeSent: (verificationId, forceResendingToken) =>
            //           log(verificationId),
            //       codeAutoRetrievalTimeout: (verificationId) => log(verificationId),
            //     );
            //   },
            // ),
            ifSent
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        _auth.verifyPhoneNumber(
                          phoneNumber: number.text,
                          verificationCompleted: (phoneAuthCredential) =>
                              log("Successful"),
                          verificationFailed: (error) => log("failed"),
                          codeSent: (verificationId, forceResendingToken) =>
                              log(verificationId),
                          codeAutoRetrievalTimeout: (verificationId) =>
                              log(verificationId),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
            TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffFB297B))),
                onPressed: () {
                  setState(() {
                    ifSent = true;
                  });
                },
                child: const Text(
                  "Send OTP",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
