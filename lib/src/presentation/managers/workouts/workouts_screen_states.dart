class WorkoutsScreenStates {}
class WorkoutsScreenInitialState extends WorkoutsScreenStates{}
class WorkoutsScreenLoadingState extends WorkoutsScreenStates{}
class WorkoutsScreenSuccessState extends WorkoutsScreenStates{}
class WorkoutsScreenErrorState extends WorkoutsScreenStates{
  Exception? exception;
  WorkoutsScreenErrorState({this.exception});
}