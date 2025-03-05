import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/repositories/smart_coach_repo/smart_coach_repo.dart';
import 'package:super_fitness_app/src/domain/smart_coach/smart_coach_creator.dart';
import 'package:super_fitness_app/src/domain/smart_coach/smart_coach_model.dart';

@Injectable(as: SmartCoachRepo)
class SmartCoachRepoImpl implements SmartCoachRepo {
  final SmartCoachCreator _coachCreator;
  late SmartCoachModel _smartCoachModel;

  SmartCoachRepoImpl(this._coachCreator);


  @override
  Future<ApiResult<void>> sendMessage(SmartCoachType type,String message) async {
    _createSmartCoach(type);
    try {
      await executeApi<void>(apiCall: () async {
        await _smartCoachModel.sendMessage(message);
      });
      return Success<void>();
    } catch (e) {
      return Failures<void>(
          exception: e is Exception ? e : Exception(e.toString()));
    }
  }

  void _createSmartCoach(SmartCoachType type) {
    _smartCoachModel = _coachCreator.createSmartCoach(type);
  }
}
