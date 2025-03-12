import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';
import 'package:super_fitness_app/src/domain/usecases/workouts/muscles_group_use_case.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_states.dart';


@injectable
class WorkoutsScreenViewModel extends Cubit<WorkoutsScreenStates> {
  final MusclesGroupUseCase _musclesGroupUseCase;
  WorkoutsScreenViewModel(this._musclesGroupUseCase):super(WorkoutScreenInitialState());


  getMusclesGroup() async {
    emit(WorkoutScreenLoadingState());
    var result = await _musclesGroupUseCase.getMusclesGroups();
    switch (result) {
      case Success<List<MusclesGroupEntity>>():
        emit(WorkoutScreenSuccessState());
        break;
      case Failures<List<MusclesGroupEntity>>():
        emit(WorkoutScreenErrorState(exception: result.exception));
        break;
    }
  }
  doAction(WorkoutsScreenActions action){
    switch (action) {
      case GetMusclesGroup():
        getMusclesGroup();
        break;
    }
  }
}