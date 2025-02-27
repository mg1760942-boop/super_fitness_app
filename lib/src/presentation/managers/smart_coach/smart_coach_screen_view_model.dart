

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';

@injectable
class SmartCoachScreenViewModel extends Cubit<SmartCoachScreenState>{
  SmartCoachScreenViewModel():super(SmartCoachScreenInitial());




  doAction(SmartCoachScreenActions action){
    switch (action) {
      case StartChatAction():
        emit(ChatViewState());
        break;
    }
  }

}