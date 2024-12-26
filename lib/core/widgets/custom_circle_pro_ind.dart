import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class CustomCircleProgIndicator extends StatelessWidget {
  const CustomCircleProgIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
