import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../managers/edit_profle/edit_profile_cubit.dart';

class EditProfilePageViewWidget extends StatelessWidget {
  const EditProfilePageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel = context.read<EditProfileCubit>();
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: editProfileViewModel.pageController,
          itemBuilder: (context, index) =>
          editProfileViewModel.editProfileBodyWidget[index],
          itemCount: editProfileViewModel.editProfileBodyWidget.length,
        );
      },
    );
  }
}
