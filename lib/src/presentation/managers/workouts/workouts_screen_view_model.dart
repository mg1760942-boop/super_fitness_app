import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';
import 'package:super_fitness_app/src/domain/usecases/workouts/full_body_muscles_use_case.dart';
import 'package:super_fitness_app/src/domain/usecases/workouts/get_all_exercises_use_case.dart';
import 'package:super_fitness_app/src/domain/usecases/workouts/get_exercises_by_muscle_id_use_case.dart';
import 'package:super_fitness_app/src/domain/usecases/workouts/muscles_group_use_case.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_states.dart';

@injectable
class WorkoutsScreenViewModel extends Cubit<WorkoutsScreenStates> {
  final MusclesGroupUseCase _musclesGroupUseCase;
  final GetAllExercisesUseCase _allExercisesUseCase;
  final GetExercisesByMuscleIdUseCase _byMuscleIdUseCase;
  final FullBodyMusclesUseCase _fullBodyMusclesUseCase;

  WorkoutsScreenViewModel(this._musclesGroupUseCase, this._byMuscleIdUseCase,
      this._allExercisesUseCase, this._fullBodyMusclesUseCase)
      : super(WorkoutsScreenInitialState());
  List<MusclesGroupEntity> musclesGroup = [];
  List<MusclesEntity> currentListView = [];
  int selectedTab = 0;

  _getMusclesGroup() async {
    emit(WorkoutsScreenLoadingState());
    var result = await _musclesGroupUseCase.getMusclesGroups();
    switch (result) {
      case Success<List<MusclesGroupEntity>>():
        musclesGroup = result.data ?? [];
        musclesGroup.insert(0, MusclesGroupEntity(id: "", name: "Full Body"));
        emit(WorkoutsScreenSuccessState());
        break;
      case Failures<List<MusclesGroupEntity>>():
        emit(WorkoutsScreenErrorState(exception: result.exception));
        break;
    }
  }

  _changeSelectedTab(int newTab) {
    selectedTab = newTab;
    emit(SelectedTabChangedState());
    _getExercisesData();
  }

  _getFullBodyMuscles() async {
    var result = await _fullBodyMusclesUseCase.getFullBodyMuscles();
    switch (result) {
      case Success<List<MusclesEntity>>():
        currentListView = result.data ?? [];
        emit(WorkoutsScreenSuccessState());
        break;
      case Failures<List<MusclesEntity>>():
        emit(WorkoutsScreenErrorState(exception: result.exception));
        break;
    }
  }

  // _getExerciseByMuscleId(String id) async {
  //   var result = await _byMuscleIdUseCase.getExercisesByMuscleId(id);
  //   switch (result) {
  //     case Success<List<ExerciseEntity>>():
  //       currentListView = result.data??[];
  //       emit(WorkoutsScreenSuccessState());
  //       break;
  //     case Failures<List<ExerciseEntity>>():
  //       emit(WorkoutsScreenErrorState(exception: result.exception));
  //       break;
  //   }
  // }

  _getExercisesData() async {
    emit(WorkoutsScreenLoadingState());
    if (selectedTab == 0) {
      await _getFullBodyMuscles();
    } else {
      // await _getExerciseByMuscleId(musclesGroup[selectedTab].id ?? "");
    }
  }

  doAction(WorkoutsScreenActions action) {
    switch (action) {
      case GetMusclesGroupAction():
        _getMusclesGroup();
        break;
      case ChangeSelectedTabAction():
        _changeSelectedTab(action.selectedTab ?? 0);
        break;
      case GetMusclesDataAction():
        _getExercisesData();
        break;
    }
  }
}
