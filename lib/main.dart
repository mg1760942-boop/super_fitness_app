import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/super_ditness_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {

  WidgetsBinding widgetsFlutterBinding =
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsFlutterBinding,
  );
  await configureDependencies();
  FlutterNativeSplash.remove();

  runApp(const SuperFitnessApp());
}



