import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';

@injectable
class GetMusclesByMuscleGroupIdUseCase {
  final WorkoutsRepository _workoutsRepository;

  GetMusclesByMuscleGroupIdUseCase(this._workoutsRepository);

  Future<ApiResult<List<MusclesEntity>>> getMusclesByMuscleGroupId(
      String muscleGroupId) async {
    return await _workoutsRepository.getMusclesByGroupId(muscleGroupId);
  }
}
