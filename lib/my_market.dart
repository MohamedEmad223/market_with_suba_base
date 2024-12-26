import 'package:flutter/material.dart';
import 'package:my_market/core/routes/app_routes.dart';
import 'package:my_market/core/routes/routes.dart';

import 'core/theming/app_colors.dart';

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes().generateRoute,
      initialRoute: Routes.login,
      debugShowCheckedModeBanner: false,
      title: 'Our Market',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
        useMaterial3: true,
      ),
    );
  }
}
