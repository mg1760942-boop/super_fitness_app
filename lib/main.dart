import 'package:flutter/material.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/super_ditness_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const SuperFitnessApp());
}
