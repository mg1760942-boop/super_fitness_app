import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/utilities/style/app_icons.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/pages/register/widgets/circular_indicator_widget.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../managers/register/register_viewmodel.dart';

class BaseRegisterScreen extends StatefulWidget {
  const BaseRegisterScreen({super.key});

  @override
  State<BaseRegisterScreen> createState() => _BaseRegisterScreenState();
}

class _BaseRegisterScreenState extends State<BaseRegisterScreen> {
  final RegisterViewModel _viewmodel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BaseScaffold(
      backGroundPath: AppImages.backgroundScafSec,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _viewmodel,
          child: BlocBuilder<RegisterViewModel, RegisterState>(
            builder: (context, state) {
              // Determine if we need to show the back button.
              final showBackButton = _viewmodel.currentPage > 0;
              final total = _viewmodel.registerObjects.length;
              final current = _viewmodel.currentPage + 1; // 1-based display
              final progress = _viewmodel.currentPage == 0 ? 0.0 : current / total;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: showBackButton
                              ? Container(
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
                                    onPressed: () {
                                      _viewmodel.changePage(
                                          _viewmodel.currentPage - 1);
                                    },
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              AppImages.appLogo,
                              width: 70,
                              height: 48,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  // Progress Indicator
                  CircularIndicatorWidget(
                    progress: progress,
                    current: current,
                    total: total,
                  ),
                  verticalSpace(8),
                  // PageView
                  Expanded(
                    child: PageView.builder(
                      itemCount: _viewmodel.registerObjects.length,
                      controller: _viewmodel.pageController,
                      onPageChanged: (index) {
                        _viewmodel.changePage(index);
                      },
                      itemBuilder: (context, index) {
                        return _viewmodel.registerObjects[index];
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
