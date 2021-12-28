import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mysmartdesk/router/app_router.gr.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => context.router
              .push(OtpVerificationRoute(number: "+919501179924")),
        ),
      ),
    );
  }
}
