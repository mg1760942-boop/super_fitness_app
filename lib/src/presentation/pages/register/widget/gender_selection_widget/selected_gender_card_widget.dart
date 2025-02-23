import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/register/widget/gender_selection_widget/selected_gender_card_item_widget.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_icons.dart';
import '../../../../shared/blured_container.dart';

class SelectedGenderCardWidget extends StatelessWidget {
  const SelectedGenderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel=context.watch<RegisterViewModel>();
    return BlocBuilder<RegisterViewModel, RegisterState>(
      builder: (context, state) {
        return BluredContainer(
          radius: BorderRadius.all(Radius.circular(50)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectedGenderCardItemWidget(
                  text: "Male",
                  isSelected: registerViewModel.selectedGender==Gender.male ?  true : false,
                  onTap: () => registerViewModel.changeGender(Gender.male) ,
                  image: AppIcons.maleIcon,),
                SelectedGenderCardItemWidget(
                  text: "Female",
                  isSelected: registerViewModel.selectedGender==Gender.female ?  true : false,
                  onTap: () => registerViewModel.changeGender(Gender.female) ,
                  image: AppIcons.femaleIcon,),
                verticalSpace(24),
                registerViewModel.selectedGender==Gender.unSelectionGender ?SizedBox():
                CustomAuthButton(text: "Next", onPressed: () {
                registerViewModel.goToOldAraYouScreenNext();
                }, color: AppColors.primary, radius: 50)
              ],
            ),
          ),
        );
      },
    );
  }
}
