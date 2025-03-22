import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/domain/entities/meals/meals_by_category_entity.dart';
import 'package:super_fitness_app/src/presentation/managers/meals/meal_detail/meal_detail_cubit.dart';
import 'package:super_fitness_app/src/presentation/pages/meals/widgets/ingradient_item.dart';
import 'package:super_fitness_app/src/presentation/pages/meals/widgets/meal_image_header.dart';
import 'package:super_fitness_app/src/presentation/pages/meals/widgets/recomendation_section.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final MealDetailCubit _cubit = getIt<MealDetailCubit>();
  String? mealId;
  late MealsByCategoryEntity meals;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String?, dynamic>?;
      if (args != null) {
        setState(() {
          mealId = args['id'];
          meals = args['list'];
        });
        _cubit.id = args['id'];
        _cubit.getMealsDetail();
      } else {
        debugPrint("⚠️ No arguments received in MealDetailScreen.");
      }
    });
  }

  List<dynamic> getTwoRandomMeals() {
    final List<MealsEntity> mealList = List.from(meals.meals as Iterable);
    if (mealList.length <= 2) return mealList;
    mealList.shuffle(Random());
    return mealList.take(2).toList();
  }

  List<Widget> buildIngredientList() {
    final List<Widget> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final String? ingredient =
          _cubit.mealDetailEntity?.toJson()['strIngredient$i'] as String?;
      final String? measure =
          _cubit.mealDetailEntity?.toJson()['strMeasure$i'] as String?;
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(IngredientItem(
          ingredient: ingredient,
          measure: measure ?? '',
        ));
      }
    }
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final List<dynamic> randomMeals = getTwoRandomMeals();

    return BaseScaffold(
      backGroundPath: AppImages.backgroundScaf,
      body: BlocProvider<MealDetailCubit>.value(
        value: _cubit,
        child: SafeArea(
          child: BlocConsumer<MealDetailCubit, MealDetailState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is MealsDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MealImageHeader(
                      height: height * 0.45,
                      mealThumb: _cubit.mealDetailEntity?.strMealThumb ?? '',
                      mealName: _cubit.mealDetailEntity?.strMeal ?? '',
                      mealArea: _cubit.mealDetailEntity?.strArea ?? '',
                    ),
                    verticalSpace(24),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.ingredients,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.40,
                            ),
                          ),
                          verticalSpace(8),
                          BluredContainer(
                            padding: const EdgeInsets.all(8),
                            color: const Color(0xCC242424),
                            radius: BorderRadius.circular(20),
                            child: Column(children: buildIngredientList()),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RecommendationSection(randomMeals: randomMeals),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
