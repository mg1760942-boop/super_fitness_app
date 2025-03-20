import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_fitness_app/config/localization/l10n.dart';
import 'package:super_fitness_app/src/presentation/managers/localization/localization_viewmodel.dart';
import 'config/routes/app_routes.dart';
import 'config/routes/page_route_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'config/theme/app_theme.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class SuperFitnessApp extends StatelessWidget {
  const SuperFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationViewmodel()..getSavedLanguage(),
      child: BlocBuilder<LocalizationViewmodel, LocalizationState>(
        builder: (context, state) {
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
                    locale: Locale(
                        BlocProvider.of<LocalizationViewmodel>(context)
                            .cachedLanguageCode),
                    supportedLocales: L10n.all,
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navKey,
                    initialRoute: PageRoutesName.recommendation,
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    themeMode: ThemeMode.dark,
                    theme: AppTheme.defaultTheme,
                  ));
        },
      ),
    );
  }
}
