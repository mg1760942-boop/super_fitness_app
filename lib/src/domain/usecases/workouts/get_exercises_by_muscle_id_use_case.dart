

import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/exercises_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';

@injectable
class GetExercisesByMuscleIdUseCase {
  final WorkoutsRepository _workoutsRepository;

  GetExercisesByMuscleIdUseCase(this._workoutsRepository);

  Future<ApiResult<List<ExerciseEntity>>> getExercisesByMuscleId(String muscleId) async {
    return await _workoutsRepository.getExercisesByMuscleId(muscleId);
  }
}