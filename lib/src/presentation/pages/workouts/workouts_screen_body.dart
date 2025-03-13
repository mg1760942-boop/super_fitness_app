import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/pages/workouts/tab_bar_list.dart';

import '../../../../core/common/common_imports.dart';

class WorkoutsScreenBody extends StatelessWidget {
  const WorkoutsScreenBody({super.key});

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
                itemBuilder: (context, index) {
                  return Text(
                    "Good",
                    style: AppTextStyles.font24w600White,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
