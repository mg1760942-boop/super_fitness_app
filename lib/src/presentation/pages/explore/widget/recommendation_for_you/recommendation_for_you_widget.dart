import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/widget/recommendation_for_you/recommendation_for__you_list_widget.dart';
import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/explore/explore_cubit.dart';

class RecommendationForYouWidget extends StatelessWidget {
  const RecommendationForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var exploreCubit = context.read<ExploreCubit>();
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.localizations.recommendationForYou,
                    style: AppFonts.font16KWightWeightW60Font,
                  ),
                  Text(
                    context.localizations.seeAll,
                    style: AppFonts.font14KWightPrimaryW400Font,
                  ),
                ],
              ),
              verticalSpace(8),
              RecommendationForYouListWidget(),
            ],
          ),
        ));
  }
}
