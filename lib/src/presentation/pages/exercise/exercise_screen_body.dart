import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/difficulty_selection.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/exercise_list.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/header_section.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_text_styles.dart';

class ExerciseScreenBody extends StatelessWidget {
  const ExerciseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ExerciseScreenViewModel>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.kBlackBase.withOpacity(.8),
          expandedHeight: 244.0.h,
          floating: false,
          pinned: true,
          leading: null,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              bool isCollapsed = constraints.biggest.height <= 150;
              return Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Column(
                      children: [
                        HeaderSection(),
                      ],
                    ),
                  ),
                  if (isCollapsed)
                    FlexibleSpaceBar(
                      title: Text(
                        "Exercise",
                        style: AppTextStyles.font16w700
                            .copyWith(color: AppColors.kWhiteBase),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: DifficultySelection(),
        ),
        SliverToBoxAdapter(child: ExerciseList())
      ],
    );
  }
}
