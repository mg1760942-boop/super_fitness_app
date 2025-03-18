import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/exercises_entity.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';

abstract interface class WorkoutsRepository {
  Future<ApiResult<List<MusclesGroupEntity>>> getMusclesGroup();
  Future<ApiResult<List<MusclesEntity>>> getFullBodyMuscles();
  Future<ApiResult<List<ExerciseEntity>>> getExercisesByMuscleId(String muscleId);
  Future<ApiResult<List<ExerciseEntity>>> getAllExercises();
}