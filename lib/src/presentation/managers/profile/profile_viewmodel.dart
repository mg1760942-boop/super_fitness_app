import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/profile/profile_usecase.dart';

import '../../../domain/entities/app_user_entity/app_user_entity.dart';

part 'profile_state.dart';

@injectable
class ProfileViewmodel extends Cubit<ProfileState> {
  ProfileUsecase profileUsecase;

  ProfileViewmodel(
    this.profileUsecase,
  ) : super(ProfileInitial());
  bool isEnabled = true;
  AppUserEntity? appUserEntity;
  void getUserData() async {
    try {
      emit(ProfileLoading());
      final result = await profileUsecase();
      switch (result) {
        case Success<AppUserEntity?>():
          appUserEntity = result.data;
          emit(ProfileLoaded(result.data));
          break;
        case Failures<AppUserEntity?>():
          emit(ProfileError(result.exception));
          break;
      }
    } catch (e) {
      emit(ProfileError(e as Exception));
    }
  }

  void switchLanguage(bool value) {
    isEnabled = value;
    emit(SwitchLanguageState());
  }
}
