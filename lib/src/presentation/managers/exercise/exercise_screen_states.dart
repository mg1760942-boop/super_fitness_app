abstract class ExerciseScreenStates {}
final class InitialExerciseScreenState extends ExerciseScreenStates {}
final class NavigateToBackState extends ExerciseScreenStates{}
final class ExerciseListErrorState extends ExerciseScreenStates{
  final Exception? exception;
  ExerciseListErrorState({this.exception});
}
final class ExerciseListLoadingState extends ExerciseScreenStates{}
final class ExerciseListLoadedState extends ExerciseScreenStates{}