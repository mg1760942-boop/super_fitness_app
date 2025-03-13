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
  WorkoutsScreenViewModel(this._musclesGroupUseCase):super(WorkoutsScreenInitialState());
  List<MusclesGroupEntity> musclesGroup = [];
  int selectedTab = 0;
  _getMusclesGroup() async {
    emit(WorkoutsScreenLoadingState());
    var result = await _musclesGroupUseCase.getMusclesGroups();
    switch (result) {
      case Success<List<MusclesGroupEntity>>():
        musclesGroup = result.data??[];
        musclesGroup.insert(0, MusclesGroupEntity(id: "",name: "Full Body"));
        emit(WorkoutsScreenSuccessState());
        break;
      case Failures<List<MusclesGroupEntity>>():
        emit(WorkoutsScreenErrorState(exception: result.exception));
        break;
    }
  }

  _changeSelectedTab(int newTab){
    selectedTab = newTab;
    emit(SelectedTabChangedState());
  }
  doAction(WorkoutsScreenActions action){
    switch (action) {
      case GetMusclesGroupAction():
        _getMusclesGroup();
        break;
      case ChangeSelectedTabAction():
        _changeSelectedTab(action.selectedTab??0);
        break;
    }
  }
}