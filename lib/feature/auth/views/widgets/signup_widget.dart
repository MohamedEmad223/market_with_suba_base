import 'package:flutter/material.dart';

import 'custom_row_with_arrow.dart';
import 'custom_text_btn.dart';
import 'custom_text_field.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          labelText: "Name",
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextFormField(
          labelText: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          labelText: "Password",
          keyboardType: TextInputType.visiblePassword,
          isSecured: true,
          suffIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_off),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomRowWithArrowBtn(
          text: "Sign Up",
          onTap: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        CustomRowWithArrowBtn(
          text: "Sign Up With Google",
          onTap: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
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
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    );
  }
}
