import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';

import '../../../../core/common/common_imports.dart';

class DifficultySelection extends StatelessWidget {
  const DifficultySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.kBlackBase.withOpacity(0.9),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _difficultButtonItem(context.localization.beginner, true),
            _difficultButtonItem(context.localization.intermediate, false),
            _difficultButtonItem(context.localization.advanced, false),
          ],
        ),
      ),
    );
  }

  Widget _difficultButtonItem(String text, bool isSelected){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
        color: isSelected? AppColors.mainColor: AppColors.kBlackBase,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected? AppColors.mainColor:AppColors.kBlackBase.withOpacity(0.9), width: 1),
      ),
      child: Text(
        text,
        style: AppTextStyles.font12w700.copyWith(color: AppColors.kWhiteBase),
      ),
    );
  }
}
