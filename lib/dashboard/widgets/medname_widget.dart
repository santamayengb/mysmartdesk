import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';

class MedNameWidget extends StatelessWidget {
  const MedNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: TextFormField(
          cursorColor: kPrimaryColor,
          decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              focusColor: kPrimaryColor,
              prefixIcon: Icon(
                Icons.medication,
                color: kPrimaryColor,
              ),
              filled: true,
              fillColor: Colors.black),
        ));
  }
}
