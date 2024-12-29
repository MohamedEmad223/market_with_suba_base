import 'package:flutter/material.dart';

import '../../../../core/functions/navigate_to.dart';
import '../screens/forget_view.dart';
import 'custom_text_btn.dart';

class ForgetPasswordRowWidgets extends StatelessWidget {
  const ForgetPasswordRowWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: "Forgot Password?",
          onTap: () {
            navigateTo(context, const ForgotView());
          },
        ),
      ],
    );
  }
}
