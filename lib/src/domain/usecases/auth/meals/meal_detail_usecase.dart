import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meal_detail_entity.dart';

import '../../../../../core/common/apis/api_result.dart';
import '../../../repositories/meals/meals_repository.dart';

@injectable
class MealDetailUsecase {
  final MealsRepository _mealsRepository;

  MealDetailUsecase(this._mealsRepository);

  Future<ApiResult<MealDetailEntity?>> getMealDetail(String id) async {
    return await _mealsRepository.getMealDetail(id);
  }
}
