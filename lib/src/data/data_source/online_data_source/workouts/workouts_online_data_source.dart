import '../../../api/core/api_response_models/workouts/muscles_group_response_model.dart';

abstract interface class WorkoutsOnlineDataSource {
  Future<MusclesGroupResponseModel> getMusclesGroup();
}