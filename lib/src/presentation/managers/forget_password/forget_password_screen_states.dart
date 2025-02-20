import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/forget_password_screen.dart';

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
  final ForgetPasswordScreenViews? view;
  ForgetPasswordScreenSuccessState({this.message,this.view});
}

class CompleteResetPasswordState extends ForgetPasswordScreenStates{
  final String? message;
  CompleteResetPasswordState({this.message});
}