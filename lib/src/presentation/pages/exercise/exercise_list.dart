import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';
import 'exercise_item_list_view.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.kBlackBase.withOpacity(0.8),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ExerciseItemListView();
          },
        ),
      ),
    );
  }
}
