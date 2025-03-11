
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/api_services.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/muscles_group_response_model.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/workouts/workouts_online_data_source.dart';

@Injectable(as: WorkoutsOnlineDataSource)
class WorkoutsOnlineDataSourceImpl implements WorkoutsOnlineDataSource{

  final ApiServices _apiServices;
  WorkoutsOnlineDataSourceImpl(this._apiServices);
  @override
  Future<MusclesGroupResponseModel> getMusclesGroup() async{
    return await _apiServices.getMusclesGroup();
  }

}