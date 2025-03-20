import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import '../../../domain/entities/app_user_entity/app_user_entity.dart';
import '../../../domain/entities/meals/meals_by_category_entity.dart';
import '../../../domain/entities/meals/meals_category_entity.dart';
import '../../../domain/entities/meals/meals_rondom_entity.dart';
import '../../../domain/usecases/auth/meals/get_random_entity_use_case.dart';
import '../../../domain/usecases/auth/meals/meal_by_category_usecase.dart';
import '../../../domain/usecases/auth/meals/meal_category_usecase.dart';
import '../../../domain/usecases/auth/profile/profile_usecase.dart';
import 'explore_action.dart';
import 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final ProfileUsecase _getProfileUseCase;
  final GetRandomEntityUseCase _getRandomEntityUseCase;
  final MealCategoryUsecase _getCategoriesUseCase;
  final MealByCategoryUsecase _getMealsByCategoryUseCase;
  ExploreCubit(
    this._getProfileUseCase,
    this._getRandomEntityUseCase,
    this._getCategoriesUseCase,
    this._getMealsByCategoryUseCase,
  ) : super(ExploreInitial());

  Future<void> doAction(ExploreAction action) async {
    switch (action) {
      case GetProfileAction():
        return await _getProfile();
      case GetRandomMusclesAction():
        return await _getMusclesRandom();
      case GetUpcomingWorkTapAction():
        return await _getUpcomingWorkTap();
      case ChangeCurrentCategoryAction():
        return changeCurrentCategory(action.category ?? "");
    }
  }

  /// Upcoming Workouts Tap
  List<CategoryEntity> _getUpcomingWorkTapList = [];
  List<CategoryEntity> get getUpcomingWorkTapList => _getUpcomingWorkTapList;
  Future<void> _getUpcomingWorkTap() async {
    emit(ExploreGetUpcomingWorkTapLoadingState());
    var result = await _getCategoriesUseCase.getCategories();
    switch (result) {
      case Success<MealsCategoryEntity>():
        _getUpcomingWorkTapList = result.data?.categories ?? [];
        changeCurrentCategory(  _getUpcomingWorkTapList[0].strCategory ?? "");
        emit(ExploreGetUpcomingWorkTapSuccessState());
      case Failures<MealsCategoryEntity>():
        emit(ExploreErrorState(
          result.exception,
        ));
    }
  }

  ///Upcoming Workouts Body Weight
  String _currentCategory = "";
  String get currentCategory => _currentCategory;
  Future<void> changeCurrentCategory(String value) async {
    if (_currentCategory == value) return;
    _currentCategory = value;
    await _getUpcomingWorkTapBody();
    emit(ChangeCurrentCategoryState());
  }
  List<MealsEntity> _mealsByCategory = [];
  List<MealsEntity> get mealsByCategory => _mealsByCategory;
  Future<void> _getUpcomingWorkTapBody() async {
    emit(ExploreGetUpcomingWorkBodyTapLoadingState());
    _mealsByCategory = [];
    var result = await _getMealsByCategoryUseCase.getMealsByCategory(
        currentCategory);
    switch (result) {
      case Success<MealsByCategoryEntity>():
       _mealsByCategory = result.data?.meals ?? [];
        emit(ExploreGetUpcomingWorkBodyTapSuccessState());
      case Failures<MealsByCategoryEntity>():
        emit(ExploreErrorState(
          result.exception,
        ));
    }
  }





  /// Random Muscles Entity
  List<MealsRandomEntity> _musclesRandom = [];
  List<MealsRandomEntity> get musclesRandom => _musclesRandom;
  Future<void> _getMusclesRandom() async {
    emit(ExploreGetMusclesRandomLoadingState());
    var result = await _getRandomEntityUseCase.execute();
    switch (result) {
      case Success<List<MealsRandomEntity>>():
        _musclesRandom = result.data ?? [];
        emit(ExploreGetMusclesRandomSuccessState());
      case Failures<List<MealsRandomEntity>>():
        emit(ExploreErrorState(
          result.exception,
        ));
    }
  }


  /// User Entity
  AppUserEntity? _userEntity;
  AppUserEntity? get userEntity => _userEntity;
  Future<void> _getProfile() async {
    emit(ExploreGetProfileLoadingState());
    var result = await _getProfileUseCase();
    switch (result) {
      case Success<AppUserEntity?>():
        _userEntity = result.data;
        emit(ExploreGetProfileSuccessState());
      case Failures<AppUserEntity?>():
        emit(ExploreErrorState(
          result.exception,
        ));
    }
  }
}
