import 'package:super_fitness_app/src/presentation/pages/register/widget/gender_selection_widget/selected_gender_card_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class GenderSelectionBodyWidget extends StatelessWidget {
  const GenderSelectionBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        verticalSpace(100),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "TELL US ABOUT YOURSELF",
                    style: AppFonts.font20KWightWeightW800Font,
                  ),
                  verticalSpace(2),
                  Text(
                    "We Need To Know Your Gender",
                    style: AppFonts.font18KWightWeightW400Font,
                  ),
                ],
              ),
            ),
            SelectedGenderCardWidget()
          ],
        ),
      ],
    );
  }
}
