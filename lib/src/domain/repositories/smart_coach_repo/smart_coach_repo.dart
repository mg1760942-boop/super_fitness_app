import 'package:super_fitness_app/core/common/apis/api_result.dart';

abstract interface class SmartCoachRepo{
  Future<ApiResult<void>> sendMessage(String message);
}