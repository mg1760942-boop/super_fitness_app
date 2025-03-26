import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/domain/entities/exercise/difficulty_level_entity.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_view_model.dart';

import '../../../../core/common/common_imports.dart';

class DifficultySelection extends StatefulWidget {
  const DifficultySelection({super.key});

  @override
  State<DifficultySelection> createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  int selectedDiff = 0;
  List<DifficultyLevelEntity> difficultyLevels = [];

  @override
  void initState() {
    super.initState();
    difficultyLevels = context
        .read<ExerciseScreenViewModel>()
        .doAction(GetDifficultyLevelsAction());
    selectedDiff = context
        .read<ExerciseScreenViewModel>()
        .doAction(GetCurrentSelectedDifficultyAction());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ExerciseScreenViewModel>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.kBlackBase.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
           shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: difficultyLevels.length,
            itemBuilder: (context, index) {
              return _difficultButtonItem(
                  difficultyLevels[index], index, context);
            }),
      ),
    );
  }

  Widget _difficultButtonItem(
      DifficultyLevelEntity difficulty, int index, BuildContext context) {
    final viewModel = context.read<ExerciseScreenViewModel>();
    bool isSelected = selectedDiff == index;
    return FadeInUp(
      duration: Duration(milliseconds: 300 + index * 100),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedDiff = index;
            viewModel
                .doAction(UpdateSelectedDifficultyAction(selectedDiff: index));
          });
        },
        child: AnimatedContainer(
          margin: EdgeInsets.only(right: 48.w),
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
              horizontal: 8, vertical: isSelected ? 4 : 1),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : AppColors.kBlackBase,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: isSelected
                    ? AppColors.mainColor
                    : AppColors.kBlackBase.withOpacity(0.9),
                width: 1),
          ),
          child: Text(
            difficulty.name ?? "Level",
            style: isSelected
                ? AppTextStyles.font14w800
                : AppTextStyles.font12w700.copyWith(color: AppColors.kWhiteBase),
          ),
        ),
      ),
    );
  }
}

enum Difficulty { beginner, intermediate, advanced }
