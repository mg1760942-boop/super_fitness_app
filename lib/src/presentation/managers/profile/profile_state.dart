part of 'profile_viewmodel.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final AppUserEntity? appUserEntity;

  ProfileLoaded(this.appUserEntity);
}

final class ProfileError extends ProfileState {
  final Exception exception;

  ProfileError(this.exception);
}

final class SwitchLanguageState extends ProfileState {
  SwitchLanguageState();
}
