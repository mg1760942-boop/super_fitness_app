import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';

import '../../../../core/common/common_imports.dart';

class WorkoutsScreenBody extends StatelessWidget {
  const WorkoutsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Text(
            "good",
            style: AppTextStyles.font20w500,
          );
        });
  }
}
