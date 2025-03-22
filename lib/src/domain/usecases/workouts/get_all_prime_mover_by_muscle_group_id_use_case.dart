import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';

@injectable
class GetAllPrimeMoverByMuscleGroupIdUseCase {
  final WorkoutsRepository _workoutsRepository;

  GetAllPrimeMoverByMuscleGroupIdUseCase(this._workoutsRepository);

  Future<ApiResult<List<MusclesEntity>>> getAllPrimeMoverByMuscleGroupId(
      String muscleGroupId) async {
    return await _workoutsRepository.getAllPrimeMoverByGroupId(muscleGroupId);
  }
}
