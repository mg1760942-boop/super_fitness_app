
import 'package:flutter/material.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';

class AppRoutes {
  AppRoutes._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.splash:
        return _handelMaterialPageRoute(
            widget: const Scaffold(), settings: settings);

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
