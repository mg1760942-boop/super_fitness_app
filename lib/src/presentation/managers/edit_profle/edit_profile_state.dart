part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
class ChangePageState extends EditProfileState {}
class ChangeSelectedGoalState extends EditProfileState {}
class ChangeSelectedPhysicalActivityState extends EditProfileState {}
class ChangeEnableState extends EditProfileState {}
class GoNextToSectionAppScreen extends EditProfileState {}
class GoNextPageWeightState extends EditProfileState {}
class GoNextPageGoalState extends EditProfileState {}
class GoNextPagePhysicalActivityState extends EditProfileState {}
class ChangeSelectedWeightState extends EditProfileState {}
class GoNextPageEditProfileFormField extends EditProfileState {}
class EditProfileLoadingState extends EditProfileState {}
class EditProfileSuccessState extends EditProfileState {}
class EditProfileErrorState extends EditProfileState {
  final Exception exception;
  EditProfileErrorState({required this.exception});
}


class UpdateProfileLoading extends EditProfileState {}
class UpdateProfileSuccess extends EditProfileState {}
class UpdateProfileError extends EditProfileState {
  final Exception exception;
  UpdateProfileError({required this.exception});
}