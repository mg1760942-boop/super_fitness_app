import 'package:flutter/material.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/meals/recommendation_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/profile/help_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/profile/privacy_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/profile/security_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/register/view/register_view.dart';
import 'package:super_fitness_app/src/presentation/pages/section/section_screen.dart';

import '../../src/presentation/pages/edit_profile/view/edit_profile_view.dart';
import '../../src/presentation/pages/login/login_screen.dart';
import '../../src/presentation/pages/meals/meal_detail_screen.dart';
import '../../src/presentation/pages/register/base_register_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.splash:
        return _handleMaterialPageRoute(
            widget: const Scaffold(body: Center(child: Text('Splash Screen'))),
            settings: settings);
      case PageRoutesName.onboarding:
        return _handleMaterialPageRoute(
            widget: OnboardingScreen(), settings: settings);
      case PageRoutesName.login:
        return _handleMaterialPageRoute(
            widget: const LoginScreen(), settings: settings);
      case PageRoutesName.mealDetail:
        return _handleMaterialPageRoute(
            widget: MealDetailScreen(), settings: settings);
      case PageRoutesName.register:
        return _handleMaterialPageRoute(
            widget: const RegisterView(), settings: settings);
      case PageRoutesName.registerBase:
        return _handleMaterialPageRoute(
            widget: BaseRegisterScreen(), settings: settings);
      case PageRoutesName.forgetPassword:
        return _handleMaterialPageRoute(
            widget: ForgetPasswordScreen(), settings: settings);
      case PageRoutesName.recommendation:
        return _handleMaterialPageRoute(
            widget: RecommendationScreen(), settings: settings);
      case PageRoutesName.privacyScreen:
        return _handleMaterialPageRoute(
            widget: PrivacyScreen(), settings: settings);
      case PageRoutesName.securityScreen:
        return _handleMaterialPageRoute(
            widget: SecurityScreen(), settings: settings);
      case PageRoutesName.helpScreen:
        return _handleMaterialPageRoute(
            widget: const HelpScreen(), settings: settings);
      case PageRoutesName.sectionScreen:
        return _handleMaterialPageRoute(
            widget: SectionScreen(), settings: settings);
      case PageRoutesName.editProfile:
        return _handleMaterialPageRoute(
            settings: settings, widget: EditProfileView());
      default:
        return _handleMaterialPageRoute(
            widget: const Scaffold(body: Center(child: Text('Page Not Found'))),
            settings: settings);
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute({
    required Widget widget,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
