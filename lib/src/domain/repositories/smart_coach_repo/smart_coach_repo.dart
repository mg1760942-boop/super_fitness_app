import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/smart_coach/smart_coach_creator.dart';

abstract interface class SmartCoachRepo{
  Future<ApiResult<String>> sendMessage(SmartCoachType type,String message);
}