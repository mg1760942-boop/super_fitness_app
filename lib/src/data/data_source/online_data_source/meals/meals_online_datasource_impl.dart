import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/categories_response.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/meals_by_category_response.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/meals_detail_response.dart';
import 'package:super_fitness_app/src/data/api/second_base_url/second_api_service.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/meals/meals_online_datasource.dart';

@Injectable(as: MealsOnlineDataSource)
class MealsOnlineDatasourceImpl implements MealsOnlineDataSource {
  final SecondApiService apiServices;
  MealsOnlineDatasourceImpl(this.apiServices);

  @override
  Future<CategoriesResponse> getMealCategories() async {
    var response = await apiServices.getMealCategories();
    return response;
  }

  @override
  Future<MealsByCategoryResponse> getMealsByCategory(String category) async {
    var response = await apiServices.getMealsByCategory(category);
    return response;
  }

  @override
  Future<MealsDetailResponse> getMealsDetail(String id) async {
    var response = await apiServices.getMealDetail(id);
    return response;
  }
}
