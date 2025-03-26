import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';

import '../../../../core/common/common_imports.dart';

class DifficultySelection extends StatefulWidget {
  const DifficultySelection({super.key});

  @override
  State<DifficultySelection> createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  Difficulty currentDiff = Difficulty.beginner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.kBlackBase.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _difficultButtonItem(
                context.localization.beginner, Difficulty.beginner),
            _difficultButtonItem(
                context.localization.intermediate, Difficulty.intermediate),
            _difficultButtonItem(
                context.localization.advanced, Difficulty.advanced),
          ],
        ),
      ),
    );
  }

  Widget _difficultButtonItem(String text, Difficulty difficulty) {
    return InkWell(
      onTap: () {
        setState(() {
          currentDiff = difficulty;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: currentDiff == difficulty
              ? AppColors.mainColor
              : AppColors.kBlackBase,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: currentDiff == difficulty
                  ? AppColors.mainColor
                  : AppColors.kBlackBase.withOpacity(0.9),
              width: 1),
        ),
        child: Text(
          text,
          style: AppTextStyles.font12w700.copyWith(color: AppColors.kWhiteBase),
        ),
      ),
    );
  }
}

enum Difficulty { beginner, intermediate, advanced }
