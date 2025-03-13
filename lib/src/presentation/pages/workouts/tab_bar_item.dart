import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_view_model.dart';

import '../../../../core/common/common_imports.dart';

class TabBarItem extends StatelessWidget {
  final String muscle;
  final int index;

  const TabBarItem({super.key, required this.muscle, required this.index});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WorkoutsScreenViewModel>();
    return InkWell(
      onTap: () {
        viewModel.doAction(ChangeSelectedTabAction(selectedTab: index));
      },
      child: FadeInUp(
        child: Container(
          height: 20.h,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: viewModel.selectedTab == index
                ? AppColors.mainColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(200),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              muscle,
              style: AppTextStyles.font12W700,
            ),
          ),
        ),
      ),
    );
  }
}
