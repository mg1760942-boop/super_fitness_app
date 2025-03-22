import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/pages/meals/widgets/recommendation_card.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';

class RecommendationSection extends StatelessWidget {
  final List<dynamic> randomMeals;

  const RecommendationSection({
    Key? key,
    required this.randomMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.recommendation,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.40,
          ),
        ),
        verticalSpace(8),
        Row(
          children: randomMeals.map((meal) {
            final String imageUrl = meal.strMealThumb ?? '';
            final String title = meal.strMeal ?? '';
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RecommendationCard(
                  imageUrl: imageUrl,
                  title: title,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
