import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/api_services.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/exercise/difficulty_levels_response_model.dart';

import 'exercise_online_data_source.dart';

@Injectable(as: ExerciseOnlineDataSource)
class ExerciseOnlineDataSourceImpl implements ExerciseOnlineDataSource{

  final ApiServices _apiServices;

  ExerciseOnlineDataSourceImpl(this._apiServices);


  @override
  Future<DifficultyLevelsReponseModel> getAllDifficultyLevels() async{
    return await _apiServices.getAllLDifficultyLevels();
  }

}