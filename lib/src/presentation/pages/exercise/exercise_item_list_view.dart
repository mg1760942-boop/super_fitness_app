import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';

class ExerciseItemListView extends StatelessWidget {
  const ExerciseItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Image.asset(AppImages.backgroundScafSec, fit: BoxFit.cover)
                  ),
                ),
                _exerciseContent(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5.h,
            decoration: BoxDecoration(
              color: AppColors.kGray
            ),
          )
        ],
      ),
    );
  }
  
  Widget _exerciseContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bench Press", style: AppTextStyles.font18W500,),
        verticalSpace(4),
        Text("3 sets, 10 reps", style: AppTextStyles.font14w400,),
        Text("discription", style: AppTextStyles.font14w400,)
      ],
    );
  }
}
