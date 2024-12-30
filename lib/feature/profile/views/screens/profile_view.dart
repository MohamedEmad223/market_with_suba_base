import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market/core/functions/navigate_to.dart';
import 'package:my_market/feature/auth/views/screens/login_view.dart';
import 'package:my_market/feature/profile/logic/cubit/logout_cubit.dart';
import 'package:my_market/feature/profile/views/screens/edit_name_view.dart';
import 'package:my_market/feature/profile/views/screens/my_orders.dart';
import 'package:my_market/feature/profile/views/widgets/custom_row_btn.dart';

import '../../../../core/functions/show_msg.dart';
import '../../../../core/theming/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .65,
          child: Card(
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
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.kPrimaryColor,
                    foregroundColor: AppColors.kWhiteColor,
                    child: Icon(
                      Icons.person,
                      size: 45,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "User Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("User Email"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRowBtn(
                    onTap: () => navigateTo(context, const EditNameView()),
                    icon: Icons.person,
                    text: "Edit Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRowBtn(
                    onTap: () => navigateTo(context, const MyOrdersViwe()),
                    icon: Icons.shopping_basket,
                    text: "My Orders",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRowBtn(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return BlocProvider.value(
                            value: context.read<LogoutCubit>(),
                            child: BlocConsumer<LogoutCubit, LogoutState>(
                              listener: (context, state) {
                                if (state is LogoutSuccess) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginView();
                                  }));
                                }
                                if (state is LogoutFailed) {
                                  showMsg(context, state.error);
                                }
                              },
                              builder: (context, state) {
                                return AlertDialog(
                                  title: const Text("Logout"),
                                  content: const Text(
                                      "Are you sure you want to logout?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(dialogContext);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<LogoutCubit>().logout();
                                      },
                                      child: const Text("Logout"),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    icon: Icons.logout,
                    text: "Logout",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
