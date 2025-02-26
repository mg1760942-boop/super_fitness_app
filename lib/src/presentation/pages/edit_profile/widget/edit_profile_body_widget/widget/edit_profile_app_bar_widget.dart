import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness_app/src/presentation/managers/edit_profle/edit_profle_action.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../managers/edit_profle/edit_profile_cubit.dart';

class EditProfileAppBarWidget extends StatelessWidget {
  const EditProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel=context.read<EditProfileCubit>();
    return         Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFF4100),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: SvgPicture.asset(
                  AppIcons.backIcon,
                  color: Colors.white,
                  width: 10,
                  height: 10,
                ),
                onPressed: () =>editProfileViewModel.doAction(GoNextSectionAppScreenAction())
              ),
            )
        ),
        Text("Edit Profile",style: AppTextStyles.font20w600White,),
        const SizedBox(width: 24),
      ],
    );
  }
}
