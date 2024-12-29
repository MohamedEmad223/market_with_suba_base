import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/signup_widget.dart';
import '../widgets/welcome_widgets.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
            WelcomeWidgets(),
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
                child: SignupWidget()
              ),
            )
          ],
        ),
      )),
    );
  }
}
