class MealsByCategoryEntity {
  final List<MealsEntity>? meals;

  MealsByCategoryEntity({
    this.meals,
  });
}

class MealsEntity {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  MealsEntity({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });
}
