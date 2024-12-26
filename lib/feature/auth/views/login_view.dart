import 'package:flutter/material.dart';
import 'package:my_market/core/functions/navigate_to.dart';

import '../../../core/theming/app_colors.dart';
import '../../nav_bar/ui/main_home_view.dart';
import 'forget_view.dart';
import 'signin_view.dart';
import 'widgets/custom_row_with_arrow.dart';
import 'widgets/custom_text_btn.dart';
import 'widgets/custom_text_field.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            const Text(
              "Welcome To Our Market",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
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
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      labelText: "Password",
                      isSecured: true,
                      suffIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          text: "Forgot Password?",
                          onTap: () {
                            navigateTo(context, const ForgotView());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRowWithArrowBtn(
                      text: "Login",
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRowWithArrowBtn(
                      text: "Login With Google",
                      onTap: () => navigateTo(context, MainHomeView()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
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
}