import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_by_category_entity.dart';

import '../../../../../core/common/apis/api_result.dart';
import '../../../repositories/meals/meals_repository.dart';

@injectable
class MealByCategoryUsecase {
  final MealsRepository _mealsRepository;

  MealByCategoryUsecase(this._mealsRepository);

  Future<ApiResult<MealsByCategoryEntity>> getMealsByCategory(
      String category) async {
    return await _mealsRepository.getMealsByCategory(category);
  }
}
