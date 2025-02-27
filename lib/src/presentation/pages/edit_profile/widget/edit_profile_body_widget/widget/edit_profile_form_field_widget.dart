
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/edit_profle/edit_profle_action.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/helpers/validations.dart';
import '../../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../../core/utilities/style/spacing.dart';
import '../../../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../../../shared/custom_auth_text_form_field.dart';

class EditProfileFormFieldWidget extends StatelessWidget {
  const EditProfileFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel=context.read<EditProfileCubit>();
    return Form (
      key: editProfileViewModel.formKey,
      onChanged: () => editProfileViewModel.
      doAction(ChangeEnableAction(isEnable: true)),
      child: Column(
        children: [
          CustomTextFormField(
            labelText:  editProfileViewModel.appUserEntity.firstName.toString(),
            hintText: editProfileViewModel.appUserEntity.firstName.toString(),
            keyboardType: TextInputType.name,
            controller: editProfileViewModel.firstNameController,
            validator: (value) => Validations.validateName(value),
            prefixIcon: AppIcons.userIcon,),
          verticalSpace(16),
          CustomTextFormField(
            labelText:  editProfileViewModel.appUserEntity.lastName.toString(),
            hintText: editProfileViewModel.appUserEntity.firstName.toString(),
            keyboardType: TextInputType.name,
            controller: editProfileViewModel.lastNameController,
            validator: (value) => Validations.validateName(value),
            prefixIcon: AppIcons.userIcon,),
          verticalSpace(16),
          CustomTextFormField(
            labelText:  editProfileViewModel.appUserEntity.email.toString(),
            hintText: editProfileViewModel.appUserEntity.email.toString(),
            keyboardType: TextInputType.emailAddress,
            controller: editProfileViewModel.emailController,
            validator: (value) => Validations.validateEmail(value),
            prefixIcon: AppIcons.emailIcon,),
          verticalSpace(40),
        ],
      ),
    );
  }
}
