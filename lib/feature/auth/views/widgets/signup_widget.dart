import 'package:flutter/material.dart';

import 'custom_row_with_arrow.dart';
import 'custom_text_btn.dart';
import 'custom_text_field.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

final formKey = GlobalKey<FormState>();
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController emailController = TextEditingController();
bool isSecured = false;

class _SignupWidgetState extends State<SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          labelText: "Name",
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          controller: emailController,
          labelText: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          controller: passwordController,
          labelText: "Password",
          keyboardType: TextInputType.visiblePassword,
          isSecured: !isSecured,
          suffIcon: IconButton(
            onPressed: () {
              setState(() {
                isSecured = !isSecured;
              });
            },
            icon: isSecured
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
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
