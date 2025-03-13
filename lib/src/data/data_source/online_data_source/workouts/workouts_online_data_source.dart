import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_exercises_response_model.dart';

import '../../../api/core/api_response_models/workouts/muscles_group_response_model.dart';

abstract interface class WorkoutsOnlineDataSource {
  Future<MusclesGroupResponseModel> getMusclesGroup();
  Future<AllExercisesResponseModel> getAllExercises();
}