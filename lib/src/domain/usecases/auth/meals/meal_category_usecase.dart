import 'package:injectable/injectable.dart';

import '../../../../../core/common/apis/api_result.dart';
import '../../../entities/meals/meals_category_entity.dart';
import '../../../repositories/meals/meals_repository.dart';

@injectable
class MealCategoryUsecase {
  final MealsRepository _mealsRepository;

  MealCategoryUsecase(this._mealsRepository);

  Future<ApiResult<MealsCategoryEntity>> getCategories() async {
    return await _mealsRepository.getCategories();
  }
}
