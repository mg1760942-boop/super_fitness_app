import 'package:flutter/material.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const SuperFitnessApp());
}
