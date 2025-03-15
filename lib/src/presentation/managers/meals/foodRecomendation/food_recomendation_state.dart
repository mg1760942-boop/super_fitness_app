part of 'food_recommendation_viewmodel.dart';

@immutable
sealed class FoodRecommendationState {}

final class FoodRecommendationInitial extends FoodRecommendationState {}

final class MealsCategoriesLoading extends FoodRecommendationState {}

final class MealsCategoriesSuccess extends FoodRecommendationState {}

final class MealsCategoriesFailure extends FoodRecommendationState {
  final Exception exception;

  MealsCategoriesFailure(this.exception);
}

final class MealsByCategoryLoading extends FoodRecommendationState {}

final class MealsByCategorySuccess extends FoodRecommendationState {}

final class MealsByCategoryFailure extends FoodRecommendationState {
  final Exception exception;

  MealsByCategoryFailure(this.exception);
}
