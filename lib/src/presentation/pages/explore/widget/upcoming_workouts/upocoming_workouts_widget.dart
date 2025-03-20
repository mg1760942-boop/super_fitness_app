import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/src/presentation/managers/explore/explore_state.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/explore/explore_cubit.dart';
import '../../../../shared/item_explore_widget.dart';

class UpcomingWorkoutsListWidget extends StatelessWidget {
  const UpcomingWorkoutsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var exploreCubit = context.read<ExploreCubit>();
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if(state is ExploreGetUpcomingWorkBodyTapLoadingState){
          return  Center(child: CircularProgressIndicator(color: AppColors.primary,));
        }
        return Skeletonizer(
          enabled: exploreCubit.mealsByCategory.isEmpty,
            child: SizedBox(
              height: 80.h,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemImageExploreWidget(
                      width: 80,
                      height: 80,
                      position: 54,
                      imageUrl: exploreCubit.mealsByCategory[index].strMealThumb ?? "",
                      title: exploreCubit.mealsByCategory[index].strMeal ?? "",
                      index: index,
                    );
                  }, separatorBuilder: (context, index) {
                return horizontalSpace(16);
              }, itemCount: exploreCubit.mealsByCategory.length),
            ),
          );

      },
    );
  }
}
