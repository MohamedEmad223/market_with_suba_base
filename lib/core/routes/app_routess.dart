import 'package:flutter/material.dart';
import 'package:my_market/feature/auth/views/screens/signin_view.dart';

import '../../feature/auth/views/screens/login_view.dart';
import '../../feature/nav_bar/ui/main_home_view.dart';
import '../../feature/profile/views/screens/profile_view.dart';
import 'routes.dart';

class PageRoutes extends MaterialPageRoute {
  PageRoutes({required super.builder});
}

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return PageRoutes(builder: (context) => LoginView());
      case Routes.register:
        return PageRoutes(builder: (context) => const SignupView());
      case Routes.home:
        return PageRoutes(builder: (context) =>  MainHomeView());
      case Routes.profile:
        return PageRoutes(builder: (context) => const ProfileView());
      default:
        return null;
    }
  }
}
