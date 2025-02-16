abstract class ForgetPasswordScreenStates{}

class ForgetPasswordScreenInitialState extends ForgetPasswordScreenStates{}
class ForgetPasswordScreenLoadingState extends ForgetPasswordScreenStates{
  final String? message;
  ForgetPasswordScreenLoadingState({this.message});
}

class ForgetPasswordScreenErrorState extends ForgetPasswordScreenStates{
  final Exception? exception;
  ForgetPasswordScreenErrorState(this.exception);
}

class ForgetPasswordScreenSuccessState extends ForgetPasswordScreenStates{
  final String? message;
  ForgetPasswordScreenSuccessState({this.message});
}
