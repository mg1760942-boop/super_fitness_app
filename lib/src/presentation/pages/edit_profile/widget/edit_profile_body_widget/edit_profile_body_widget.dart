import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/edit_profile_app_bar_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/edit_profile_form_field_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/info_selection_edit_profile_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/widget/user_profile_section_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_colors.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../shared/custom_auth_button.dart';

class EditProfileBodyWidget extends StatelessWidget {
  const EditProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
          titleForm: "90 KG",
          onTap: () {
          },
        ),
        verticalSpace(16),
        InfoSelectionEditProfileWidget(
          title: "Your Goal ",
          titleForm: "Gain weight",
          onTap: () {
          },
        ),
        verticalSpace(16),
        InfoSelectionEditProfileWidget(
          title: "Your activity level ",
          titleForm: "Rookie",
          onTap: () {
          },
        ),
        verticalSpace(20),
        CustomAuthButton(text: "Update",
            onPressed: () {

            },
            color: AppColors.mainColor,
            radius: 12)
      ],

    );
  }
}
