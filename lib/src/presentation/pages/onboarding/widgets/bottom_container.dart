import 'package:super_fitness_app/src/domain/entities/onboarding_entity.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';

import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../../../super_ditness_app.dart';
import 'onboarding_buttons.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer(
      {super.key,
      required this.pageController,
      required this.onboardingList,
      required this.currentPage,
      required this.changePage});
  final PageController pageController;
  final List<OnboardingEntity> onboardingList;
  final int currentPage;
  final void Function(
    int index,
  ) changePage;
  @override
  Widget build(BuildContext context) {
    return BluredContainer(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      radius: BorderRadius.only(
        topLeft: Radius.circular(50.r),
        topRight: Radius.circular(50.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text content at the top
          Column(
            children: [
              Text(
                onboardingList[currentPage].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                onboardingList[currentPage].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0.sp,
                  color: Colors.white70,
                ),
              ),
              verticalSpace(24),
            ],
          ),
          // Buttons at the bottom inside the blurred container
          NextBackButtuns(
            finish: () {
              navKey.currentState!.pushReplacementNamed(PageRoutesName.login);
            },
            pageController: pageController,
            length: onboardingList.length,
            changePage: changePage,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}
