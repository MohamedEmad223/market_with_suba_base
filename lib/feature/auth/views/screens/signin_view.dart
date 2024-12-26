import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../widgets/custom_row_with_arrow.dart';
import '../widgets/custom_text_btn.dart';
import '../widgets/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            
            const SizedBox(
              height: 24,
            ),
            Card(
              color: AppColors.kWhiteColor,
              margin: const EdgeInsets.all(24),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
