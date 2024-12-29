import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market/feature/auth/logic/cubit/auth_cubit.dart';
import 'package:my_market/feature/auth/views/widgets/custom_text_field.dart';

import '../../../../core/functions/navigate_to.dart';
import '../../../../core/routes/routes.dart';
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

final GlobalKey<FormState> _fformKey = GlobalKey<FormState>();
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
    AuthCubit authCubit = context.read<AuthCubit>();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
            case LoginLoading():
              CircularProgressIndicator();
              break;

            case LoginFailed():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
              break;

            case LoginSuccess():
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.home,
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login Success"),
                ),
              );
              break;

            default:
              break;
          }
          },
          builder: (context, state) {
            return Form(
              key: _fformKey,
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
                    onTap: () {
                      if(_fformKey.currentState!.validate()){
                        authCubit.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRowWithArrowBtn(
                    text: "Login With Google",
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainHomeView())),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DoNotHaveAnAccount()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
