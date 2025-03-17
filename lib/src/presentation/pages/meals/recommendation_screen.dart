import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_by_category_entity.dart';
import 'package:super_fitness_app/src/presentation/managers/meals/foodRecomendation/food_recommendation_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/shared/base_gridview.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_icons.dart';
import '../../shared/filter_list_row.dart';

class RecommendationScreen extends StatefulWidget {
  RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  FoodRecommendationViewmodel viewmodel = getIt<FoodRecommendationViewmodel>();
  @override
  void initState() {
    viewmodel.getCategories();
    viewmodel.getMealsByCategory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backGroundPath: AppImages.baseBackGround,
      body: BlocProvider(
        create: (context) => viewmodel,
        child:
            BlocBuilder<FoodRecommendationViewmodel, FoodRecommendationState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF4100),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: SvgPicture.asset(
                                  AppIcons.backIcon,
                                  color: Colors.white,
                                  width: 10,
                                  height: 10,
                                ),
                                onPressed: () {
                                  navKey.currentState!.pop();
                                },
                              ),
                            )),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Food Recommendation",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                    verticalSpace(24),
                    FilterListRow(
                      categories: viewmodel.categories?.map((e) => e.strCategory ?? '').toList() ?? [],
                      selectedCategory: viewmodel.currentCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          viewmodel.currentCategory = category;
                          viewmodel.getMealsByCategory();
                        });
                      },
                    ),
                    verticalSpace(24),
                    if (state is MealsByCategoryLoading)
                      Lottie.asset(AppImages.loading),
                    if (state is MealsByCategorySuccess)
                      BaseGridview<MealsEntity>(
                        items: viewmodel.mealsByCategoryEntity!.meals,
                        titleBuilder: (meal) =>
                            meal?.strMeal ??
                            '', // Replace 'name' with actual title field
                        imageUrlBuilder: (meal) =>
                            meal?.strMealThumb ??
                            '', // Replace 'imageUrl' with actual field
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
