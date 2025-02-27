import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/repositories/smart_coach_repo/smart_coach_repo.dart';

import '../../../data/repository/smart_coach/smart_coach_repo_impl.dart';
import '../../smart_coach/smart_coach_creator.dart';

@injectable
class SendMessageUseCase{
  final SmartCoachRepo _smartCoachRepo;
  SendMessageUseCase(@factoryParam SmartCoach type, SmartCoachCreator coachCreator)
      : _smartCoachRepo = SmartCoachRepoImpl(coachCreator, type);

  Future<ApiResult<void>> smartCoach(String message) async {
    return await _smartCoachRepo.sendMessage(message);
  }
}