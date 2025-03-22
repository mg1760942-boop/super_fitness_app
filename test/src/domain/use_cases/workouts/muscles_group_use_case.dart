

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/workouts/workouts_repository.dart';
import 'package:super_fitness_app/src/domain/usecases/workouts/muscles_group_use_case.dart';

import 'muscles_group_use_case.mocks.dart';

@GenerateMocks([WorkoutsRepository])
void main(){
  late WorkoutsRepository _workoutsRepository;
  late MusclesGroupUseCase _musclesGroupUseCase;
  setUp((){
    _workoutsRepository = MockWorkoutsRepository();
    _musclesGroupUseCase = MusclesGroupUseCase(_workoutsRepository);
  });
  group("Testing get muscles group use case", (){
    var successMockedResult = Success<List<MusclesGroupEntity>>(data: []);
    var failureMockedResult = Failures<List<MusclesGroupEntity>>(exception: Exception("Error"));
    test("testing to get success data", () async {
      provideDummy<ApiResult<List<MusclesGroupEntity>>>(successMockedResult);
      when(_workoutsRepository.getMusclesGroup()).thenAnswer((_)async=> successMockedResult);
      var actualResult = await _musclesGroupUseCase.getMusclesGroups();
      expect(actualResult, successMockedResult);
      verify(_musclesGroupUseCase.getMusclesGroups()).called(1);
    });
    test("testing to get failure data", () async {
      provideDummy<ApiResult<List<MusclesGroupEntity>>>(failureMockedResult);
      when(_workoutsRepository.getMusclesGroup()).thenAnswer((_)async=> failureMockedResult);
      var actualResult = await _musclesGroupUseCase.getMusclesGroups();
      expect(actualResult, failureMockedResult);
      verify(_musclesGroupUseCase.getMusclesGroups()).called(1);
    });
  });
}