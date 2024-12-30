import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market/feature/auth/logic/cubit/resetpassword_cubit.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/custom_elevated_btn.dart';
import '../widgets/custom_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void clearForm() {
    _emailController.clear();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetpasswordCubit(),
      child: Scaffold(
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Enter Your Email To Reset Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
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
                      CustomTextFormField(
                        controller: _emailController,
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<ResetpasswordCubit, ResetpasswordState>(
                        listener: (context, state) {
                          if (state is ResetpasswordSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Reset Password Email Sent"),
                              ),
                            );
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.login,
                              (route) => false,
                            );
                          } else if (state is ResetpasswordFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.error),
                              ),
                            );
                          } else if (state is ResetpasswordLoading) {
                            CircularProgressIndicator();
                          }
                        },
                        builder: (context, state) {
                          return CustomEBtn(
                            text: "Sumbit",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ResetpasswordCubit>()
                                    .resetPassword(
                                      email: _emailController.text,
                                    );
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
