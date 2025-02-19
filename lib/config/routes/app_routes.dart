import 'package:flutter/material.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/src/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/register/view/register_view.dart';

import '../../src/presentation/pages/login/login_screen.dart';
import '../../src/presentation/pages/register/base_register_screen.dart';

class AppRoutes {
  AppRoutes._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.splash:
        return _handelMaterialPageRoute(
            widget: const Scaffold(), settings: settings);
      case PageRoutesName.onboarding:
        return _handelMaterialPageRoute(
            widget: OnboardingScreen(), settings: settings);
      case PageRoutesName.login:
        return _handelMaterialPageRoute(
            widget: const LoginScreen(), settings: settings);
      case PageRoutesName.register:
        return _handelMaterialPageRoute(
            widget: const RegisterView(), settings: settings
        )  ;
      case PageRoutesName.registerBase:
        return _handelMaterialPageRoute(
            widget: BaseRegisterScreen(), settings: settings);
      default:
        return _handelMaterialPageRoute(
            widget: const Scaffold(), settings: settings);
    }
  }

  static MaterialPageRoute<dynamic> _handelMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
