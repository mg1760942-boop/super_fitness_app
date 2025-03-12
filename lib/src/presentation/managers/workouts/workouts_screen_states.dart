class WorkoutsScreenStates {}
class WorkoutScreenInitialState extends WorkoutsScreenStates{}
class WorkoutScreenLoadingState extends WorkoutsScreenStates{}
class WorkoutScreenSuccessState extends WorkoutsScreenStates{}
class WorkoutScreenErrorState extends WorkoutsScreenStates{
  Exception? exception;
  WorkoutScreenErrorState({this.exception});
}