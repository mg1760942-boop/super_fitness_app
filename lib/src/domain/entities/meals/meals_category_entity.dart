class MealsCategoryEntity {
  final List<CategoryEntity>? categories;

  MealsCategoryEntity({
    this.categories,
  });
}

class CategoryEntity {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  CategoryEntity({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });
}
