import 'package:flutter/material.dart';
import 'package:my_market/feature/auth/views/widgets/custom_text_field.dart';

import '../../../../core/functions/navigate_to.dart';
import '../../../nav_bar/ui/main_home_view.dart';
import '../screens/forget_view.dart';
import 'custom_row_with_arrow.dart';
import 'custom_text_btn.dart';
import 'do_not_have_an_account.dart';

class LogInBodyWidgets extends StatelessWidget {
  const LogInBodyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainHomeView())),
          ),
          const SizedBox(
            height: 20,
          ),
          DoNotHaveAnAccount()
        ],
      ),
    );
  }
}
