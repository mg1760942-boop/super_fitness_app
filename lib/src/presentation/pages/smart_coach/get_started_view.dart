import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../generated/assets.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SmartCoachScreenViewModel>();
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(40),
          Image.asset(AppImages.smartCoachRobot),
          verticalSpace(24),
          Align(
            child: BluredContainer(
              radius: BorderRadius.circular(50),
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                children: [
                  Text(
                    context.localization.howCatIAssistYou,
                    style: AppTextStyles.font24w800,
                  ),
                  verticalSpace(12),
                  CustomAuthButton(
                      text: context.localization.getStared,
                      onPressed: () {
                        viewModel.doAction(StartChatAction());
                      },
                      color: AppColors.mainColor,
                      radius: 100),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
