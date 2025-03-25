// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../src/data/api/api_services.dart' as _i318;
import '../../src/data/api/network_factory.dart' as _i801;
import '../../src/data/api/second_base_url/second_api_service.dart' as _i611;
import '../../src/data/api/upload_api_manger/upload_api_manger.dart' as _i515;
import '../../src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart'
    as _i506;
import '../../src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source_impl.dart'
    as _i122;
import '../../src/data/data_source/online_data_source/auth/auth_online_data_source.dart'
    as _i599;
import '../../src/data/data_source/online_data_source/auth/auth_online_data_source_impl.dart'
    as _i299;
import '../../src/data/data_source/online_data_source/meals/meals_online_datasource.dart'
    as _i869;
import '../../src/data/data_source/online_data_source/meals/meals_online_datasource_impl.dart'
    as _i703;
import '../../src/data/data_source/online_data_source/workouts/workouts_online_data_source.dart'
    as _i792;
import '../../src/data/data_source/online_data_source/workouts/workouts_online_data_source_impl.dart'
    as _i114;
import '../../src/data/repository/auth/auth_repository_impl.dart' as _i478;
import '../../src/data/repository/meals/meals_repository_impl.dart' as _i82;
import '../../src/data/repository/workouts/workouts_repository_impl.dart'
    as _i239;
import '../../src/domain/repositories/auth/auth_repository.dart' as _i701;
import '../../src/domain/repositories/meals/meals_repository.dart' as _i1009;
import '../../src/domain/repositories/workouts/workouts_repository.dart'
    as _i849;
import '../../src/domain/usecases/auth/edit_profile_use_case/edit_profile_use_case.dart'
    as _i173;
import '../../src/domain/usecases/auth/forget_password/forget_password_use_case.dart'
    as _i673;
import '../../src/domain/usecases/auth/login/login_usecase.dart' as _i1005;
import '../../src/domain/usecases/auth/logout/logout_use_case.dart' as _i1039;
import '../../src/domain/usecases/auth/meals/get_random_entity_use_case.dart'
    as _i697;
import '../../src/domain/usecases/auth/meals/meal_by_category_usecase.dart'
    as _i855;
import '../../src/domain/usecases/auth/meals/meal_category_usecase.dart'
    as _i761;
import '../../src/domain/usecases/auth/meals/meal_detail_usecase.dart' as _i809;
import '../../src/domain/usecases/auth/profile/profile_usecase.dart' as _i881;
import '../../src/domain/usecases/auth/register/register_use_case.dart'
    as _i545;
import '../../src/domain/usecases/auth/upload_profile_image_use_case/upload_profile_image_use_case.dart'
    as _i144;
import '../../src/domain/usecases/workouts/full_body_muscles_use_case.dart'
    as _i553;
import '../../src/domain/usecases/workouts/get_all_exercises_use_case.dart'
    as _i176;
import '../../src/domain/usecases/workouts/get_all_prime_mover_by_muscle_group_id_use_case.dart'
    as _i495;
import '../../src/domain/usecases/workouts/get_exercises_by_muscle_id_use_case.dart'
    as _i791;
import '../../src/domain/usecases/workouts/get_muscles_by_muscle_group_id_use_case.dart'
    as _i50;
import '../../src/domain/usecases/workouts/muscles_group_use_case.dart'
    as _i534;
import '../../src/presentation/managers/edit_profle/edit_profile_cubit.dart'
    as _i179;
import '../../src/presentation/managers/explore/explore_cubit.dart' as _i23;
import '../../src/presentation/managers/forget_password/controller_manager.dart'
    as _i753;
import '../../src/presentation/managers/forget_password/forget_password_screen_view_model.dart'
    as _i340;
import '../../src/presentation/managers/forget_password/validation_manager.dart'
    as _i92;
import '../../src/presentation/managers/login/login_viewmodel.dart' as _i475;
import '../../src/presentation/managers/meals/foodRecomendation/food_recommendation_viewmodel.dart'
    as _i415;
import '../../src/presentation/managers/profile/profile_viewmodel.dart'
    as _i829;
import '../../src/presentation/managers/register/register_viewmodel.dart'
    as _i278;
import '../../src/presentation/managers/section/section_Screen_viewmodel.dart'
    as _i212;
import '../../src/presentation/managers/workouts/workouts_screen_view_model.dart'
    as _i681;
import '../helpers/shared_pref/shared_pref_moduel.dart' as _i802;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefModule = _$SharedPrefModule();
    final dioProvider = _$DioProvider();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i212.SectionScreenViewmodel>(
        () => _i212.SectionScreenViewmodel());
    gh.singleton<_i753.ForgetPasswordScreenControllerManger>(
        () => _i753.ForgetPasswordScreenControllerManger());
    gh.singleton<_i92.ForgetPasswordScreenValidatorManager>(
        () => _i92.ForgetPasswordScreenValidatorManager());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => sharedPrefModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i801.AppInterceptors>(() => _i801.AppInterceptors());
    gh.factory<_i515.UploadApiManager>(() => _i515.UploadApiManagerImpl());
    gh.factory<_i506.AuthOfflineDataSource>(
        () => _i122.AuthOfflineDataSourceImpl());
    gh.singleton<_i611.SecondApiService>(
        () => _i611.SecondApiService(gh<_i361.Dio>()));
    gh.singleton<_i318.ApiServices>(() => _i318.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i792.WorkoutsOnlineDataSource>(
        () => _i114.WorkoutsOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i869.MealsOnlineDataSource>(
        () => _i703.MealsOnlineDatasourceImpl(
              gh<_i611.SecondApiService>(),
              gh<_i318.ApiServices>(),
            ));
    gh.factory<_i599.AuthOnlineDataSource>(() => _i299.AuthOnlineDataSourceImpl(
          gh<_i318.ApiServices>(),
          gh<_i515.UploadApiManager>(),
        ));
    gh.factory<_i849.WorkoutsRepository>(() =>
        _i239.WorkoutsRepositoryImpl(gh<_i792.WorkoutsOnlineDataSource>()));
    gh.factory<_i1009.MealsRepository>(
        () => _i82.MealsRepositoryImpl(gh<_i869.MealsOnlineDataSource>()));
    gh.factory<_i701.AuthRepository>(() => _i478.AuthRepositoryImpl(
          gh<_i599.AuthOnlineDataSource>(),
          gh<_i506.AuthOfflineDataSource>(),
        ));
    gh.factory<_i881.ProfileUsecase>(
        () => _i881.ProfileUsecase(gh<_i701.AuthRepository>()));
    gh.factory<_i1005.LoginUsecase>(
        () => _i1005.LoginUsecase(gh<_i701.AuthRepository>()));
    gh.factory<_i809.MealDetailUsecase>(
        () => _i809.MealDetailUsecase(gh<_i1009.MealsRepository>()));
    gh.factory<_i697.GetRandomEntityUseCase>(
        () => _i697.GetRandomEntityUseCase(gh<_i1009.MealsRepository>()));
    gh.factory<_i761.MealCategoryUsecase>(
        () => _i761.MealCategoryUsecase(gh<_i1009.MealsRepository>()));
    gh.factory<_i855.MealByCategoryUsecase>(
        () => _i855.MealByCategoryUsecase(gh<_i1009.MealsRepository>()));
    gh.factory<_i475.LoginViewmodel>(
        () => _i475.LoginViewmodel(gh<_i1005.LoginUsecase>()));
    gh.factory<_i23.ExploreCubit>(() => _i23.ExploreCubit(
          gh<_i881.ProfileUsecase>(),
          gh<_i697.GetRandomEntityUseCase>(),
          gh<_i761.MealCategoryUsecase>(),
          gh<_i855.MealByCategoryUsecase>(),
        ));
    gh.factory<_i791.GetExercisesByMuscleIdUseCase>(() =>
        _i791.GetExercisesByMuscleIdUseCase(gh<_i849.WorkoutsRepository>()));
    gh.factory<_i495.GetAllPrimeMoverByMuscleGroupIdUseCase>(() =>
        _i495.GetAllPrimeMoverByMuscleGroupIdUseCase(
            gh<_i849.WorkoutsRepository>()));
    gh.factory<_i176.GetAllExercisesUseCase>(
        () => _i176.GetAllExercisesUseCase(gh<_i849.WorkoutsRepository>()));
    gh.factory<_i534.MusclesGroupUseCase>(
        () => _i534.MusclesGroupUseCase(gh<_i849.WorkoutsRepository>()));
    gh.factory<_i553.FullBodyMusclesUseCase>(
        () => _i553.FullBodyMusclesUseCase(gh<_i849.WorkoutsRepository>()));
    gh.factory<_i50.GetMusclesByMuscleGroupIdUseCase>(() =>
        _i50.GetMusclesByMuscleGroupIdUseCase(gh<_i849.WorkoutsRepository>()));
    gh.factory<_i673.ForgetPasswordUseCase>(
        () => _i673.ForgetPasswordUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i144.UploadProfileImageUseCase>(
        () => _i144.UploadProfileImageUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i173.EditProfileUseCase>(
        () => _i173.EditProfileUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i545.RegisterUseCase>(
        () => _i545.RegisterUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i1039.LogoutUseCase>(
        () => _i1039.LogoutUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i415.FoodRecommendationViewmodel>(
        () => _i415.FoodRecommendationViewmodel(
              gh<_i761.MealCategoryUsecase>(),
              gh<_i855.MealByCategoryUsecase>(),
            ));
    gh.factory<_i681.WorkoutsScreenViewModel>(
        () => _i681.WorkoutsScreenViewModel(
              gh<_i534.MusclesGroupUseCase>(),
              gh<_i791.GetExercisesByMuscleIdUseCase>(),
              gh<_i176.GetAllExercisesUseCase>(),
              gh<_i553.FullBodyMusclesUseCase>(),
              gh<_i495.GetAllPrimeMoverByMuscleGroupIdUseCase>(),
              gh<_i50.GetMusclesByMuscleGroupIdUseCase>(),
            ));
    gh.factory<_i829.ProfileViewmodel>(() => _i829.ProfileViewmodel(
          gh<_i881.ProfileUsecase>(),
          gh<_i1039.LogoutUseCase>(),
        ));
    gh.factory<_i278.RegisterViewModel>(
        () => _i278.RegisterViewModel(gh<_i545.RegisterUseCase>()));
    gh.factory<_i179.EditProfileCubit>(() => _i179.EditProfileCubit(
          gh<_i173.EditProfileUseCase>(),
          gh<_i144.UploadProfileImageUseCase>(),
        ));
    gh.factory<_i340.ForgetPasswordScreenViewModel>(
        () => _i340.ForgetPasswordScreenViewModel(
              gh<_i673.ForgetPasswordUseCase>(),
              gh<_i753.ForgetPasswordScreenControllerManger>(),
              gh<_i92.ForgetPasswordScreenValidatorManager>(),
            ));
    return this;
  }
}

class _$SharedPrefModule extends _i802.SharedPrefModule {}

class _$DioProvider extends _i801.DioProvider {}
