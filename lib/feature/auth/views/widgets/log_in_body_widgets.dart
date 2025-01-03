import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market/feature/auth/logic/cubit/auth_cubit.dart';
import 'package:my_market/feature/auth/views/widgets/custom_text_field.dart';

import '../../../nav_bar/ui/main_home_view.dart';
import 'custom_row_with_arrow.dart';
import 'do_not_have_an_account.dart';
import 'forget_password_row_widgets.dart';

class LogInBodyWidgets extends StatefulWidget {
  const LogInBodyWidgets({super.key});

  @override
  State<LogInBodyWidgets> createState() => _LogInBodyWidgetsState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool isSecured = false;

@override
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
    final GlobalKey<FormState> fformKey = GlobalKey<FormState>();

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
               
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
                break;

              case LoginSuccess():
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainHomeView(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Login Success"),
                  ),
                );
              case GoogleSignInSuccess():
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainHomeView(),
                  ),
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
              key: fformKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    suffIcon: Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: "Password",
                    isSecured: !isSecured,
                    suffIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isSecured = !isSecured;
                        });
                      },
                      icon: isSecured
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ForgetPasswordRowWidgets(),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRowWithArrowBtn(
                    text: "Login",
                    onTap: () {
                      if (fformKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
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
                    onTap: () => context.read<AuthCubit>().nativeGoogleSignIn(),
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
