part of 'register_viewmodel.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterNextState extends RegisterState {}

final class AddGoalState extends RegisterState {}

final class AddPhysicalActivityState extends RegisterState {}
