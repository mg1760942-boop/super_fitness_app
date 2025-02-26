import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_icons.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/presentation/managers/section/section_screen_states.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/di/di.dart';
import '../../managers/section/section_Screen_viewmodel.dart';

class SectionScreen extends StatelessWidget {
  final SectionScreenViewmodel _viewModel = getIt.get<SectionScreenViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: BlocBuilder<SectionScreenViewmodel, SectionScreenState>(
        builder: (context, state) {
          return BaseScaffold(
            backGroundPath: AppImages.baseBackGround,
            // Wrap the currentScreen with a NotificationListener
            body: NotificationListener<ScrollNotification>(
              onNotification: _viewModel.onScroll,
              child: _viewModel.currentScreen,
            ),
            // Wrap bottomNavigationBar with AnimatedSlide
            bottomNavigationBar: AnimatedSlide(
              offset: _viewModel.showBottomNav ? Offset(0, 0) : Offset(0, 1),
              duration: Duration(milliseconds: 300),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  margin:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF242424),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: BottomNavigationBar(
                      currentIndex: _viewModel.currentIndex,
                      onTap: (index) {
                        _viewModel.updateCurrentIndex(index);
                      },
                      backgroundColor: Color(0xFF242424),
                      selectedItemColor: Color(0xFFFF4100),
                      unselectedItemColor: Colors.white,
                      iconSize: 30.sp,
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      selectedLabelStyle: AppTextStyles.font12w500,
                      unselectedLabelStyle: AppTextStyles.font12w400,
                      type: BottomNavigationBarType.fixed,
                      elevation: 15,
                      items: [
                        _buildBottomNavItem(
                            AppIcons.homeIcon, context.localization.explore),
                        _buildBottomNavItem(AppIcons.smartCoach,
                            context.localization.smartCoach),
                        _buildBottomNavItem(
                            AppIcons.workouts, context.localization.workouts),
                        _buildBottomNavItem(
                            AppIcons.profileIcon, context.localization.profile),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(String icon, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        width: 35.w,
        height: 35.h,
        color: Colors.white,
      ),
      activeIcon: SvgPicture.asset(
        icon,
        width: 35.w,
        height: 35.h,
        color: Color(0xFFFF4100),
      ),
      label: label,
    );
  }
}
