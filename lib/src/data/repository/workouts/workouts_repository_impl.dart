import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/workouts/workouts_online_data_source.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';

@Injectable(as: WorkoutsRepository)
class WorkoutsRepositoryImpl implements WorkoutsRepository{
  final WorkoutsOnlineDataSource _workoutsOnlineDataSource;

  WorkoutsRepositoryImpl(this._workoutsOnlineDataSource);
  @override
  Future<ApiResult<List<MusclesGroupEntity>>> getMusclesGroup() async{
    return await executeApi<List<MusclesGroupEntity>>(apiCall: ()async{
      var response = await _workoutsOnlineDataSource.getMusclesGroup();
      return response.toDomain();
    });
  }

}