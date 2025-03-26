import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/exercise/difficulty_level_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/exercise/exercise_repo.dart';

@injectable
class ExerciseUseCases {
  final ExerciseRepo _exerciseRepo;

  ExerciseUseCases(this._exerciseRepo);

  Future<ApiResult<List<DifficultyLevelEntity>>>
      getAllDifficultyLevels() async {
    return await _exerciseRepo.getAllDifficultyLevels();
  }
}
