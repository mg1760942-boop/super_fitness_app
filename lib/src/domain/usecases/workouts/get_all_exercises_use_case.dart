import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/exercises_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';

class GetAllExercisesUseCase {
  final WorkoutsRepository _workoutsRepository;

  GetAllExercisesUseCase(this._workoutsRepository);

  Future<ApiResult<List<ExerciseEntity>>> call() async {
    return await _workoutsRepository.getAllExercises();
  }
}
