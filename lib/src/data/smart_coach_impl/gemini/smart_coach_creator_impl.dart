
import 'package:injectable/injectable.dart';

import '../../../domain/smart_coach/smart_coach_creator.dart';
import '../../../domain/smart_coach/smart_coach_model.dart';
import 'gemini.dart';


@Injectable(as: SmartCoachCreator)
class SmartCoachCreatorImpl implements SmartCoachCreator {
  @override
  SmartCoachModel createSmartCoach(SmartCoach coach) {
    switch (coach) {
      case SmartCoach.gemini:
        return Gemini();
    }
  }
}