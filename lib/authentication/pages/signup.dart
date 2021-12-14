import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmailWidget(
        emailController: emailController,
      ),
    );
  }
}
