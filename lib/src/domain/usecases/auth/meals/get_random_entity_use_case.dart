
import 'package:injectable/injectable.dart';

import '../../../../../core/common/apis/api_result.dart';
import '../../../entities/meals/meals_rondom_entity.dart';
import '../../../repositories/meals/meals_repository.dart';

@injectable
class GetRandomEntityUseCase {
  final MealsRepository _mealsRepository;
  GetRandomEntityUseCase(this._mealsRepository);

  Future<ApiResult<List<MealsRandomEntity>>> execute() async {
    return await _mealsRepository.getMusclesRandom();
  }
}