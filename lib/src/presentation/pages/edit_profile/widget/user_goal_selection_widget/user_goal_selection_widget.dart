import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_images.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../../managers/edit_profle/edit_profle_action.dart';
import '../../../../shared/activity_selection_container.dart';
import '../../../register/widgets/title_sub_widget.dart';

class UserGoalSelectionWidget extends StatelessWidget {
  const UserGoalSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel = context.read<EditProfileCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(
              AppImages.appLogo, width: 70.w, height: 48.h, fit: BoxFit.cover,)),
            verticalSpace(100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  TitleSubWidget(
                      title:context.localizations.whatIsYourGoal.toUpperCase(),
                      subtitle: context.localizations.yourGoal),
                ),
                verticalSpace(8),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return ActivitySelectionContainer(
                      onChanged: (value) {

                      },
                      activity: editProfileViewModel.goals,
                      onSelected: (value) {
                      editProfileViewModel.doAction(ChangeSelectedGoalAction(goal: value));
                      },
                      selectedItem: editProfileViewModel.selectedGoal,
                      onPressedButton: () {
                        editProfileViewModel.pageController.jumpToPage(0);
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
