import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/exercise/exercise_online_data_source.dart';
import 'package:super_fitness_app/src/domain/entities/exercise/difficulty_level_entity.dart';

import '../../../domain/repositories/exercise/exercise_repo.dart';

@Injectable(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo {
  final ExerciseOnlineDataSource _exerciseOnlineDataSource;

  ExerciseRepoImpl(this._exerciseOnlineDataSource);

  @override
  Future<ApiResult<List<DifficultyLevelEntity>>>
      getAllDifficultyLevels() async {
    return await executeApi<List<DifficultyLevelEntity>>(apiCall: () async {
      var response = await _exerciseOnlineDataSource.getAllDifficultyLevels();
      return response.toDomain();
    });
  }
}
