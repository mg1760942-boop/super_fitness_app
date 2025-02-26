import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../shared/custom_auth_button.dart';

class CustomEditProfileButtonWidget extends StatelessWidget {
  const CustomEditProfileButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel = context.read<EditProfileCubit>();
    print(editProfileViewModel.isEnable);
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if(editProfileViewModel.isEnable==true){
          return CustomAuthButton(text: "Update",
              onPressed: () {
              if(editProfileViewModel.formKey.currentState!.validate()){
                Navigator.pushNamed(context, PageRoutesName.sectionScreen);
              }
              },
              color: AppColors.mainColor,
              radius: 50);

        }
        return SizedBox.shrink();
      },
    );
  }
}
