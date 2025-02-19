import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_fitness_app/config/localization/l10n.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/page_route_name.dart';
import 'config/theme/app_theme.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class SuperFitnessApp extends StatelessWidget {
  const SuperFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              debugShowCheckedModeBanner: false,
              navigatorKey: navKey,
              initialRoute: PageRoutesName.registerBase,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              themeMode: ThemeMode.dark,
              theme: AppTheme.defaultTheme,
            ));
  }
}
