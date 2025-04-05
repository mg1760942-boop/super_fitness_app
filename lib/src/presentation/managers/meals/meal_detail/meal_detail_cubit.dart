import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meal_detail_entity.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/meals/meal_detail_usecase.dart';

import '../../../../../core/common/apis/api_result.dart';

part 'meal_detail_state.dart';

@injectable
class MealDetailCubit extends Cubit<MealDetailState> {
  MealDetailUsecase mealDetailUsecase;
  MealDetailCubit(this.mealDetailUsecase) : super(MealDetailInitial());
  String? id;
  MealDetailEntity? mealDetailEntity;
  Future<void> getMealsDetail() async {
    try {
      emit(MealsDetailLoading());
      final result = await mealDetailUsecase.getMealDetail(id!);
      switch (result) {
        case Success<MealDetailEntity?>():
          mealDetailEntity = result.data;
          emit(MealsDetailSuccess(result.data!));
        case Failures<MealDetailEntity?>():
          emit(MealsDetailFailure(result.exception));
      }
    } catch (e) {
      emit(MealsDetailFailure(e as Exception));
    }
  }
}
