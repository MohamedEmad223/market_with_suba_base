import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market/feature/auth/logic/cubit/auth_cubit.dart';
import 'package:my_market/feature/auth/views/signin_view.dart';

import '../../feature/auth/views/login_view.dart';
import 'app_routes.dart';

class PageRoutes extends MaterialPageRoute {
  PageRoutes({required super.builder});
}

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return PageRoutes(builder: (context) => LoginView());
      case Routes.register:
        return PageRoutes(
            builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const SignupView(),
                ));
      default:
        return null;
    }
  }
}
