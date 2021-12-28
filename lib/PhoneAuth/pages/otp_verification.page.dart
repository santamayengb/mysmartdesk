import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({Key? key, required this.number}) : super(key: key);
  final String number;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      body: Center(
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) {
            _auth.verifyPhoneNumber(
              phoneNumber: number,
              verificationCompleted: (phoneAuthCredential) => log("Successful"),
              verificationFailed: (error) => log("failed"),
              codeSent: (verificationId, forceResendingToken) =>
                  log(verificationId),
              codeAutoRetrievalTimeout: (verificationId) => log(verificationId),
            );
          },
        ),
      ),
    );
  }
}
