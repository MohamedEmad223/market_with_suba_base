import 'package:flutter/material.dart';
import 'package:my_market/feature/auth/views/widgets/custom_text_field.dart';

import '../../../../core/functions/navigate_to.dart';
import '../../../nav_bar/ui/main_home_view.dart';
import '../screens/forget_view.dart';
import 'custom_row_with_arrow.dart';
import 'custom_text_btn.dart';
import 'do_not_have_an_account.dart';

class LogInBodyWidgets extends StatefulWidget {
  const LogInBodyWidgets({super.key});

  @override
  State<LogInBodyWidgets> createState() => _LogInBodyWidgetsState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
}

void clear() {
  _emailController.clear();
  _passwordController.clear();
}

class _LogInBodyWidgetsState extends State<LogInBodyWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const CustomTextFormField(
              labelText: "Email",
              keyboardType: TextInputType.emailAddress,
              suffIcon: Icon(Icons.email),
              
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
      ),
    );
  }
}
