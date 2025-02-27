import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:wheel_slider/wheel_slider.dart';
import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/app_images.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../../managers/edit_profle/edit_profle_action.dart';
import '../../../../shared/blured_container.dart';
import '../../../../shared/custom_auth_button.dart';
import '../../../register/widgets/title_sub_widget.dart';

class UserWeightSelectionWidget extends StatelessWidget {
  const UserWeightSelectionWidget({super.key});

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
                    title: context.localizations.yourWeight.toUpperCase(),
                    subtitle:
                    context.localizations.yourWeight
          .toUpperCase(
                  ),
                ),),
                verticalSpace(16),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return BluredContainer(
                      radius: BorderRadius.all(Radius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "KG",
                              style: AppFonts.font12MainWeight400
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                          verticalSpace(12),
                          SizedBox(
                              height: 62.h,
                              width: double.infinity,
                              child: WheelSlider.number(
                                totalCount: 150,
                                initValue: editProfileViewModel.selectWeight,
                                unSelectedNumberStyle: TextStyle(
                                  fontSize: 33.0.sp,
                                  color: AppColors.kWhiteBase,
                                  fontWeight: FontWeight.w800,
                                ),
                                selectedNumberStyle: TextStyle(
                                  fontSize: 44.0.sp,
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.w800,
                                ),
                                currentIndex: editProfileViewModel.selectWeight,
                                onValueChanged: (val) =>
                                    editProfileViewModel.doAction(
                                  ChangeSelectedWeightAction(weight: val),
                                ),
                                itemSize: 100,
                                isInfinite: true,
                                listHeight: 800,
                                listWidth: 400,
                                animationDuration: Duration(milliseconds: 300),
                                animationType: Curves.easeInOut,
                                customPointer: Container(),
                                horizontal: true,
                                scrollPhysics:
                                    BouncingScrollPhysics(),
                                showPointer: true,
                                verticalListHeight: 300,
                                horizontalListHeight: 100,
                                horizontalListWidth: 200,
                                verticalListWidth: 100,
                                hapticFeedbackType:
                                    HapticFeedbackType.selectionClick,
                              )
      
                              ),
                          verticalSpace(6),
                          const Icon(
                            Icons.arrow_drop_up,
                            size: 40,
                            color: Color(0xFFFD3C00),
                          ),
                          verticalSpace(10),
                          CustomAuthButton(
                            text: context.localizations.done,
                            onPressed: () => editProfileViewModel.doAction(
                              GoNextPageEditProfileFormFieldAction(),
                            ),
                            color: Color(0xFFFF4100),
                            textColor: Colors.white,
                            radius: 20,
                          ),
                          verticalSpace(19),
                        ],
                      ),
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
