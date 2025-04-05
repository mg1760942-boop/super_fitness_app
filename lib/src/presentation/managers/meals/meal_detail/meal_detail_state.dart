part of 'meal_detail_cubit.dart';

@immutable
sealed class MealDetailState {}

final class MealDetailInitial extends MealDetailState {}

final class MealsDetailLoading extends MealDetailState {}

final class MealsDetailSuccess extends MealDetailState {
  final MealDetailEntity mealsDetailEntity;

  MealsDetailSuccess(this.mealsDetailEntity);
}

final class MealsDetailFailure extends MealDetailState {
  final Exception exception;

  MealsDetailFailure(this.exception);
}
