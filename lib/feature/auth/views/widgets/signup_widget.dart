import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market/feature/auth/views/widgets/custom_text_field.dart';

import '../../../../core/routes/routes.dart';
import '../../logic/cubit/auth_cubit.dart';
import 'already_have_an_account_widget.dart';
import 'custom_row_with_arrow.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isSecured = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void clear() {
    _nameController.clear();
    _passwordController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          switch (state) {
            case SignupLoading():
              CircularProgressIndicator();
              break;

            case SignupFailed():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
              break;

            case SignupSuccess():
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.login,
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sign Up Success"),
                ),
              );
            case GoogleSignInSuccess():
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.login,
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sign Up Success"),
                ),
              );
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: "Name",
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: "Email",
                  suffIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _passwordController,
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
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).signUp(
                        name: _nameController.text,
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
                  text: "Sign Up With Google",
                  onTap: () => context.read<AuthCubit>().nativeGoogleSignIn(),
                ),
                const SizedBox(
                  height: 20,
                ),
                AlreadyHaveAnAccountWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}
