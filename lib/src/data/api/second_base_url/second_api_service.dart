import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/meals_by_category_response.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/meals_detail_response.dart';

import '../core/api_response_models/meals/categories_response.dart';
import '../core/constants/api_base_url.dart';
import '../core/constants/api_end_points.dart';

part 'second_api_service.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrlSec)
abstract interface class SecondApiService {
  @factoryMethod
  factory SecondApiService(Dio dio) = _SecondApiService;

  @GET(ApiEndPoints.mealCategories)
  Future<CategoriesResponse> getMealCategories();
  @GET(ApiEndPoints.mealsByCategory)
  Future<MealsByCategoryResponse> getMealsByCategory(
      @Query('c') String category);
  @GET(ApiEndPoints.mealDetail)
  Future<MealsDetailResponse> getMealDetail(@Query('i') String idMeal);
}
