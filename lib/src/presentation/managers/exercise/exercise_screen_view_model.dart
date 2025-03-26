

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_states.dart';

@injectable
class ExerciseScreenViewModel extends Cubit<ExerciseScreenStates>{
  ExerciseScreenViewModel(): super(InitialExerciseScreenState());





  doAction(ExerciseScreenActions action) {
    switch (action) {
      case NavigateToBackAction():
        emit(NavigateToBackState());
        break;
    }
  }

}