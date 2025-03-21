import 'package:super_fitness_app/src/presentation/pages/explore/widget/popular/popular_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/widget/recommendation_for_you/recommendation_for_you_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/widget/recommendation_of_day/recommendation_of_day_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/widget/upcoming_workouts/upcoming_workouts_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/widget/user/user_widget.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';
import 'category/category_widget.dart';

class ExploreBodyWidget extends StatelessWidget {
  const ExploreBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(50),
          UserWidget(),
          verticalSpace(15),
          CategoryWidget(),
          verticalSpace(24),
          RecommendationOfDayWidget(),
          verticalSpace(24),
          UpcomingWorkoutsWidget(),
          verticalSpace(24),
          RecommendationForYouWidget(),
          verticalSpace(24),
          PopularWidget(),

        ],
      ),
    );
  }
}
