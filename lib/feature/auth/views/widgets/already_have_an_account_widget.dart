import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import 'custom_text_btn.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Have an account?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        CustomTextButton(
          text: "Login",
          onTap: () {
            Navigator.pushNamed(context, Routes.login);
          },
        ),
      ],
    );
  }
}
