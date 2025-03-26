import '../../../api/core/api_response_models/exercise/difficulty_levels_response_model.dart';

abstract interface class ExerciseOnlineDataSource {
  Future<DifficultyLevelsReponseModel> getAllDifficultyLevels();
}