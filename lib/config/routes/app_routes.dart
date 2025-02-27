import 'package:flutter/material.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/smart_coach/chat_view.dart';
import 'package:super_fitness_app/src/presentation/pages/smart_coach/smart_coach_screen.dart';

import '../../src/presentation/pages/login/login_screen.dart';

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
      case PageRoutesName.forgetPassword:
        return _handelMaterialPageRoute(widget: ForgetPasswordScreen(), settings: settings);
      case PageRoutesName.smartCoach:
        return _handelMaterialPageRoute(
            widget: SmartCoachScreen(), settings: settings);
      case PageRoutesName.chatView:
        return _handelMaterialPageRoute(
            widget: const ChatView(), settings: settings);
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
