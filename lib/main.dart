import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/utilities/bloc_observer/my_bloc_observer.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

void main() async {
  WidgetsBinding widgetsFlutterBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsFlutterBinding,
  );
  await configureDependencies();
  FlutterNativeSplash.remove();
  // Bloc.observer = MyBlocObserver();
  runApp(const SuperFitnessApp());
}
