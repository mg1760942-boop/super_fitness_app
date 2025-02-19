import 'package:super_fitness_app/src/presentation/pages/register/widget/gender_selection_widget/selected_gender_card_item_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_icons.dart';
import '../../../../shared/blured_container.dart';

class SelectedGenderCardWidget extends StatelessWidget {
  const SelectedGenderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   BluredContainer(
      radius: BorderRadius.all(Radius.circular(50)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectedGenderCardItemWidget(
                text: "Male",
                onTap: () {},
                image: AppIcons.maleIcon,),
            SelectedGenderCardItemWidget(
              text: "Female",
              isSelected: true,
              onTap: () {},
              image: AppIcons.femaleIcon,)
          ],
        ),
      ),
    );
  }
}
