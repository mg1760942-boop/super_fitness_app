import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/presentation/pages/workouts/tab_bar_list.dart';
import 'package:super_fitness_app/src/presentation/pages/workouts/workouts_grip_view_item.dart';

import '../../../../core/common/common_imports.dart';

class WorkoutsScreenBody extends StatelessWidget {
  final List<MusclesEntity> musclesList;
  const WorkoutsScreenBody({super.key,required this.musclesList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(24),
            TabBarList(),
            verticalSpace(24),
            Expanded(
              child: GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: musclesList.length,
                itemBuilder: (context, index) {
                  return WorkoutsGripViewItem(musclesEntity: musclesList[index],);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
