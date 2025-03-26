import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/exercise/difficulty_level_entity.dart';
import 'package:super_fitness_app/src/domain/usecases/exercise/exercise_use_cases.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_states.dart';

@injectable
class ExerciseScreenViewModel extends Cubit<ExerciseScreenStates> {
  final ExerciseUseCases _exerciseUseCases;
  List<DifficultyLevelEntity> _difficultyLevels = [];
  int _currentSelectedDifficulty = 0;

  ExerciseScreenViewModel(this._exerciseUseCases)
      : super(InitialExerciseScreenState());

  _getDifficultyLevels() async {
    emit(ExerciseListLoadingState());
    var result = await _exerciseUseCases.getAllDifficultyLevels();
    switch (result) {
      case Success<List<DifficultyLevelEntity>>():
        _difficultyLevels = result.data ?? [];
        emit(ExerciseListLoadedState());
        break;
      case Failures<List<DifficultyLevelEntity>>():
        emit(ExerciseListErrorState(exception: result.exception));
        break;
    }
  }

  _updateSelectedDifficulty(int difficulty) {
    _currentSelectedDifficulty = difficulty;
  }

  doAction(ExerciseScreenActions action) {
    switch (action) {
      case NavigateToBackAction():
        emit(NavigateToBackState());
        break;
      case GetExerciseListAction():
        // TODO: Handle this case.
        throw UnimplementedError();
      case GetDifficultyLevelsAction():
        return _difficultyLevels;
      case GetCurrentSelectedDifficultyAction():
        return _currentSelectedDifficulty;
      case UpdateSelectedDifficultyAction():
        _updateSelectedDifficulty(action.selectedDiff);
        break;

      case GetDifficultyLevelsApiAction():
        _getDifficultyLevels();
        break;
    }
  }
}
