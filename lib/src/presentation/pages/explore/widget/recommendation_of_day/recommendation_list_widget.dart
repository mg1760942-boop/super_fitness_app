
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/explore/explore_cubit.dart';
import '../../../../shared/item_explore_widget.dart';

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var exploreCubit=context.read<ExploreCubit>();
    return SizedBox(
      height: 104.w,
      width: double.infinity,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
         return ItemImageExploreWidget(
           width: 104,
           position: 78.h,
           height: 104,
           imageUrl: exploreCubit.musclesRandom[index].image,
           title: exploreCubit.musclesRandom[index].name,
           index: index,
         );
      }, separatorBuilder: (context, index) {
         return horizontalSpace(16);
      }, itemCount: exploreCubit.musclesRandom.length),
    );
  }
}
