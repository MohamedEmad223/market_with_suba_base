import 'package:flutter/material.dart';
import 'package:my_market/core/routes/routes.dart';
import 'package:my_market/core/routes/app_routess.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theming/app_colors.dart';

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    return MaterialApp(
      onGenerateRoute: AppRoutes().generateRoute,
      initialRoute:
          client.auth.currentUser == null ? Routes.login : Routes.home,
      debugShowCheckedModeBanner: false,
      title: 'Our Market',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
        useMaterial3: true,
      ),
    );
  }
}
