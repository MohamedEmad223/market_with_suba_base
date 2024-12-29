import 'package:flutter/material.dart';

import '../../../../core/functions/navigate_to.dart';
import '../screens/signin_view.dart';
import 'custom_text_btn.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have an account?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        CustomTextButton(
            text: "Sign Up",
            onTap: () {
              navigateTo(context, const SignupView());
            })
      ],
    );
  }
}
