part of 'login_viewmodel.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final Exception exception;

  LoginErrorState(this.exception);
}

final class LoginSuccessState extends LoginState {}

final class ValidateFieldsState extends LoginState {}
