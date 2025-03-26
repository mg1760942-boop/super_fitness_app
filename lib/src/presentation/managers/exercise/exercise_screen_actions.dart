sealed class ExerciseScreenActions{}
class NavigateToBackAction extends ExerciseScreenActions{}
class GetExerciseListAction extends ExerciseScreenActions{}
class GetDifficultyLevelsAction extends ExerciseScreenActions{}
class GetCurrentSelectedDifficultyAction extends ExerciseScreenActions{}
class UpdateSelectedDifficultyAction extends ExerciseScreenActions{
  final int selectedDiff;
  UpdateSelectedDifficultyAction({required this.selectedDiff});
}

class GetDifficultyLevelsApiAction extends ExerciseScreenActions{}