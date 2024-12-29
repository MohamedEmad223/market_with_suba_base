import 'package:flutter/material.dart';
import 'package:my_market/feature/auth/views/screens/signin_view.dart';

import '../../feature/auth/views/screens/login_view.dart';
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
      default:
        return null;
    }
  }
}
