import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/meals/meals_online_datasource.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meal_detail_entity.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_by_category_entity.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_category_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/meals/meals_repository.dart';

@Injectable(as: MealsRepository)
class MealsRepositoryImpl implements MealsRepository {
  final MealsOnlineDataSource _mealsOnlineDataSource;

  MealsRepositoryImpl(this._mealsOnlineDataSource);

  @override
  Future<ApiResult<MealsCategoryEntity>> getCategories() async {
    return await executeApi<MealsCategoryEntity>(apiCall: () async {
      var response = await _mealsOnlineDataSource.getMealCategories();
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<MealDetailEntity?>> getMealDetail(String id) async {
    return await executeApi<MealDetailEntity?>(apiCall: () async {
      var response = await _mealsOnlineDataSource.getMealsDetail(id);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<MealsByCategoryEntity>> getMealsByCategory(
      String category) async {
    return await executeApi<MealsByCategoryEntity>(apiCall: () async {
      var response = await _mealsOnlineDataSource.getMealsByCategory(category);
      return response.toEntity();
    });
  }
}
