import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PinCodeTextField(
          keyboardType: TextInputType.number,
          appContext: context,
          length: 6,
          onChanged: (value) => log(value.toString()),
        ),
      ),
    );
  }
}
