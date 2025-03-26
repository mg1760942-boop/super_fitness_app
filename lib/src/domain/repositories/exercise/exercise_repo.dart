import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/exercise/difficulty_level_entity.dart';

abstract interface class ExerciseRepo{
  Future<ApiResult<List<DifficultyLevelEntity>>> getAllDifficultyLevels();
}