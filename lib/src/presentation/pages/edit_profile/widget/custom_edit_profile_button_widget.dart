import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../managers/edit_profle/edit_profle_action.dart';
import '../../../shared/custom_auth_button.dart';

class CustomEditProfileButtonWidget extends StatelessWidget {
  const CustomEditProfileButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel = context.read<EditProfileCubit>();
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (editProfileViewModel.isEnable == true) {
          return CustomAuthButton(
              text: context.localizations.done,
              onPressed: () {
                callMethodEditProfileButtonAction(editProfileViewModel);
              },
              color: AppColors.mainColor,
              radius: 50);
        }
        return SizedBox.shrink();
      },
    );
  }

  bool  callMethodEditProfileButtonAction(EditProfileCubit editProfileViewModel) {
    if (editProfileViewModel.formKey.currentState!.validate()) {
      editProfileViewModel.doAction(EditProfileButtonAction());
    }
    return false;
  }
}
