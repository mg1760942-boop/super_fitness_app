import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../../../core/utilities/style/spacing.dart';
import '../../../../../managers/edit_profle/edit_profile_cubit.dart';
import 'edit_profile_image_widget.dart';

class UserProfileSectionWidget extends StatelessWidget {
  const UserProfileSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel=context.read<EditProfileCubit>();
    return Column(
      children: [
        Center(child: EditProfileImageWidget()),
        verticalSpace(8),
        Center(child: Text(
          "${editProfileViewModel.appUserEntity.firstName} ${editProfileViewModel.appUserEntity.lastName}"
          ,style: AppTextStyles.font20w600White,)),
      ],
    );
  }
}
