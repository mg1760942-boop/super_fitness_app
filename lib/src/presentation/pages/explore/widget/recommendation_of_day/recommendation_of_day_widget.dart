import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/widget/recommendation_of_day/recommendation_list_widget.dart';
import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../managers/explore/explore_cubit.dart';

class RecommendationOfDayWidget extends StatelessWidget {
  const RecommendationOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var exploreCubit=context.read<ExploreCubit>();
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Skeletonizer(
        enabled: exploreCubit.musclesRandom.isEmpty,
        effect: PulseEffect(
          from: const Color(0xFF242424),
          to: const Color(0xFF242424),
          duration: const Duration(seconds: 1),
          lowerBound: 0.8,
          upperBound: 1.2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                context.localizations.recommendationOfTheDay,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
            verticalSpace(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: RecommendationListWidget(),

            ),
          ],
        ),
      ),
    );
  }
}
