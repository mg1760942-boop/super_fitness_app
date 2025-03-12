import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';


@injectable
class MusclesGroupUseCase {
  final WorkoutsRepository _workoutsRepository;

  MusclesGroupUseCase(this._workoutsRepository);

  Future<ApiResult<List<MusclesGroupEntity>>> getMusclesGroups() async {
    return await _workoutsRepository.getMusclesGroup();
  }
}