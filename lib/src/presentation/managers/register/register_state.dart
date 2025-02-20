part of 'register_viewmodel.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterNextState extends RegisterState {}

final class AddGoalState extends RegisterState {}

final class AddPhysicalActivityState extends RegisterState {}


class ChangePasswordVisibleState extends RegisterState{}
class ChangeGenderState extends RegisterState{}

class NavigateToNextGenderScreen extends RegisterState{}
class NavigateToOldAraYouScreenNext extends RegisterState{}
class NavigateToYearScreen extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  final Exception exception;
  RegisterErrorState(this.exception);

}