import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_exercises_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_prime_mover_by_group_id_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/muscles_by_id_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/random_muscles_response_model.dart';

import '../../../api/core/api_response_models/workouts/muscles_group_response_model.dart';

abstract interface class WorkoutsOnlineDataSource {
  Future<MusclesGroupResponseModel> getMusclesGroup();
  Future<AllExercisesResponseModel> getAllExercises();
  Future<RandomMusclesResponseModel> getRandomMuscles();
  Future<AllExercisesResponseModel> getExercisesByMuscleId(String muscleId);
  Future<AllPrimeMoverByGroupIdResposneModel> getAllPrimeMoverByGroupId(String groupId);
  Future<MusclesByIdResponseModel> getMusclesById(String muscleId);
}