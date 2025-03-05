
import 'package:super_fitness_app/src/domain/smart_coach/smart_coach_model.dart';

abstract interface class SmartCoachCreator{
  SmartCoachModel createSmartCoach(SmartCoachType coach);
}

enum SmartCoachType{
  gemini
}