import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meal_detail_entity.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_by_category_entity.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_category_entity.dart';

import '../../entities/meals/meals_rondom_entity.dart';

abstract interface class MealsRepository {
  Future<ApiResult<MealsByCategoryEntity>> getMealsByCategory(String category);
  Future<ApiResult<MealDetailEntity?>> getMealDetail(String id);
  Future<ApiResult<MealsCategoryEntity>> getCategories();
  Future<ApiResult<List<MealsRandomEntity>>> getMusclesRandom();
}
