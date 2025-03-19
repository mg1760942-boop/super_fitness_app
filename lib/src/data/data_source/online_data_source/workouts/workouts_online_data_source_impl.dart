
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/api_services.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_exercises_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_prime_mover_by_group_id_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/muscles_by_id_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/muscles_group_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/random_muscles_response_model.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/workouts/workouts_online_data_source.dart';

@Injectable(as: WorkoutsOnlineDataSource)
class WorkoutsOnlineDataSourceImpl implements WorkoutsOnlineDataSource{

  final ApiServices _apiServices;
  WorkoutsOnlineDataSourceImpl(this._apiServices);
  @override
  Future<MusclesGroupResponseModel> getMusclesGroup() async{
    return await _apiServices.getMusclesGroup();
  }

  @override
  Future<AllExercisesResponseModel> getAllExercises() async{
    return await _apiServices.getAllExercises();
  }

  @override
  Future<RandomMusclesResponseModel> getRandomMuscles() async {
    return await _apiServices.getRandomMuscles();
  }

  @override
  Future<AllExercisesResponseModel> getExercisesByMuscleId(String muscleId)  async{
    // TODO: implement getExercisesByMuscleId
    throw UnimplementedError();
  }

  @override
  Future<AllPrimeMoverByGroupIdResposneModel> getAllPrimeMoverByGroupId(String groupId) async {
    return  await _apiServices.getAllPrimeMoverByGroupId(groupId);
  }

  @override
  Future<MusclesByIdResponseModel> getMusclesById(String muscleId)async {
    return await _apiServices.getMusclesByGroupId(muscleId);
  }

}