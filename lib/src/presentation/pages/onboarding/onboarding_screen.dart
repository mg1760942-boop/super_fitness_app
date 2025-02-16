import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/presentation/managers/onboarding/onboarding_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/onboarding/widgets/bottom_container.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingViewmodel _viewmodel = OnboardingViewmodel();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backGroundPath: AppImages.backgroundScaf,
      body: BlocProvider(
        create: (_) => _viewmodel,
        child: BlocBuilder<OnboardingViewmodel, OnboardingState>(
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  /// Main PageView for your onboarding content
                  PageView.builder(
                    itemCount: _viewmodel.onboardingList.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      _viewmodel.changePage(index);
                    },
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 70, right: 16), // adjust as needed
                          child: SizedBox(
                            child: Image.asset(
                              _viewmodel.onboardingList[index].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  /// "Skip" button at the top-right
                  if (_viewmodel.currentPage !=
                      _viewmodel.onboardingList.length - 1)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: TextButton(
                        onPressed: () {
                          navKey.currentState!
                              .pushReplacementNamed(PageRoutesName.login);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: const Color(0xFFD9D9D9),
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                  /// Glass-morphism bottom container with Title, Description, Next/Back
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BottomContainer(
                        pageController: _pageController,
                        onboardingList: _viewmodel.onboardingList,
                        currentPage: _viewmodel.currentPage,
                        changePage: _viewmodel.changePage),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
