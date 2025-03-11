import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/repositories/smart_coach_repo/smart_coach_repo.dart';
import '../../smart_coach/smart_coach_creator.dart';

@injectable
class SendMessageUseCase{
  final SmartCoachRepo _smartCoachRepo;
  SendMessageUseCase(this._smartCoachRepo);

  Future<ApiResult<String>> smartCoach(SmartCoachType type, String message) async {
    return await _smartCoachRepo.sendMessage(type,message);
  }
}