import '../../../api/core/api_response_models/meals/categories_response.dart';
import '../../../api/core/api_response_models/meals/meals_by_category_response.dart';
import '../../../api/core/api_response_models/meals/meals_detail_response.dart';

abstract interface class MealsOnlineDataSource {
  Future<CategoriesResponse> getMealCategories();
  Future<MealsByCategoryResponse> getMealsByCategory(String category);
  Future<MealsDetailResponse> getMealsDetail(String id);
}
