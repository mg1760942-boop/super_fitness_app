import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_images.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../../managers/edit_profle/edit_profle_action.dart';
import '../../../../shared/activity_selection_container.dart';
import '../../../register/widgets/title_sub_widget.dart';

class UserPhysicalActivitySelectionWidget extends StatefulWidget {
  const UserPhysicalActivitySelectionWidget({super.key});

  @override
  State<UserPhysicalActivitySelectionWidget> createState() =>
      _UserPhysicalActivitySelectionWidgetState();
}

class _UserPhysicalActivitySelectionWidgetState
    extends State<UserPhysicalActivitySelectionWidget> {
  @override
  Widget build(BuildContext context) {
    var editProfileViewModel = context.read<EditProfileCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(
              AppImages.appLogo,
              width: 70.w,
              height: 48.h,
              fit: BoxFit.cover,
            )),
            verticalSpace(90),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w),
                  child: TitleSubWidget(
                    title: context.localizations.yourRegularPhysical.toUpperCase(),
                    subtitle:context.localizations.activityLevel.toUpperCase(),
                    isPhysicalActivity: true,
                  ),
                ),
                verticalSpace(16),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return ActivitySelectionContainer(
                      onChanged: (value) {},
                      activity:
                          editProfileViewModel.physicalActivity.values.toList(),
                      onSelected: (value) {
                        editProfileViewModel.doAction(
                            ChangeSelectedPhysicalActivityAction(
                                physicalActivity: value));
                      },
                      selectedItem: editProfileViewModel.selectedPhysicalActivity,
                      onPressedButton: () => editProfileViewModel.doAction(GoNextPageEditProfileFormFieldAction())
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
