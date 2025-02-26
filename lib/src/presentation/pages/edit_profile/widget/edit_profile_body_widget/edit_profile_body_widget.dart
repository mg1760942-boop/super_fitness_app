import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/edit_profle/edit_profle_action.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/edit_profile_app_bar_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/edit_profile_form_field_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/info_selection_edit_profile_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/user_profile_section_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/edit_profle/edit_profile_cubit.dart';
import '../custom_edit_profile_button_widget.dart';

class EditProfileBodyWidget extends StatelessWidget {
  const EditProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel=context.read<EditProfileCubit>();

    return  SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0.h,horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            EditProfileAppBarWidget(),
            verticalSpace(38.5),
            UserProfileSectionWidget(),
            verticalSpace(40),
            EditProfileFormFieldWidget(),
            InfoSelectionEditProfileWidget(
              title: "Your Weight  ",
              titleForm:editProfileViewModel.selectWeight.toString(),
                onTap: () =>editProfileViewModel.doAction(GoNextPageWeightAction())

            ),
            verticalSpace(16),
            InfoSelectionEditProfileWidget(
              title: "Your Goal ",
              titleForm:editProfileViewModel.selectedGoal.toString(),
                onTap: () =>editProfileViewModel.doAction(GoNextPageGoalAction())

            ),
            verticalSpace(16),
            InfoSelectionEditProfileWidget(
              title: "Your activity level ",
              titleForm:editProfileViewModel.selectedPhysicalActivity.toString(),
              onTap: () =>editProfileViewModel.doAction(GoNextPagePhysicalActivityAction())
            ),
            verticalSpace(20),
          CustomEditProfileButtonWidget()
          ],
      
        ),
      ),
    );
  }
}
