import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_category_entity.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/meals/meal_by_category_usecase.dart';

import '../../../../domain/entities/meals/meals_by_category_entity.dart';
import '../../../../domain/usecases/auth/meals/meal_category_usecase.dart';

part 'food_recomendation_state.dart';

@injectable
class FoodRecommendationViewmodel extends Cubit<FoodRecommendationState> {
  final MealCategoryUsecase mealCategoryUsecase;
  final MealByCategoryUsecase mealByCategoryUsecase;
  FoodRecommendationViewmodel(
      this.mealCategoryUsecase, this.mealByCategoryUsecase)
      : super(FoodRecommendationInitial());
  String? currentCategory;
  List<CategoryEntity>? categories;
  MealsByCategoryEntity? mealsByCategoryEntity = MealsByCategoryEntity();
  Future<void> getCategories() async {
    try {
      emit(MealsCategoriesLoading());
      final result = await mealCategoryUsecase.getCategories();
      switch (result) {
        case Success<MealsCategoryEntity>():
          categories = result.data?.categories;
          emit(MealsCategoriesSuccess());
        case Failures<MealsCategoryEntity>():
          emit(MealsCategoriesFailure(result.exception));
      }
    } catch (e) {
      emit(MealsCategoriesFailure(e as Exception));
    }
  }

  Future<void> getMealsByCategory() async {
    try {
      emit(MealsByCategoryLoading());
      final result =
          await mealByCategoryUsecase.getMealsByCategory(currentCategory!);
      switch (result) {
        case Success<MealsByCategoryEntity>():
          mealsByCategoryEntity = result.data!;
          emit(MealsByCategorySuccess());
        case Failures<MealsByCategoryEntity>():
          emit(MealsByCategoryFailure(result.exception));
      }
    } catch (e) {
      emit(MealsByCategoryFailure(e as Exception));
    }
  }
}
