import 'package:hive/hive.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';

import '../../../../core/common/common_imports.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exercise Details",
                style: AppTextStyles.font22BoldWhite,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Icon(
                    Icons.play_arrow_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          verticalSpace(8),
          Text(
            "Exercise discripton",
            style: AppTextStyles.font14w600White,
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _exerciseDetailsBox("30 min", AppColors.kWhiteBase),
              _exerciseDetailsBox("130 Cal", AppColors.mainColor),
            ],
          )
        ],
      ),
    );
  }

  Widget _exerciseDetailsBox(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.kWhiteBase, width: 0.5.w)),
      child: Text(
        text,
        style: AppTextStyles.font14w800.copyWith(color: color),
      ),
    );
  }
}
