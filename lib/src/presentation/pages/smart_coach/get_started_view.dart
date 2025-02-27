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
    return SafeArea(
      child: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customAppBar(),
            SvgPicture.asset(AppImages.smartCoachRobot),
            BluredContainer(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                children: [
                  Text(
                    "How Can I Assist You Today?",
                    style: AppTextStyles.font24w800,
                  ),
                  verticalSpace(12),
                  CustomAuthButton(
                      text: "GetStarted",
                      onPressed: () {
                        viewModel.doAction(StartChatAction());
                      },
                      color: AppColors.mainColor,
                      radius: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        horizontalSpace(56),
        Column(
          children: [
            Text(
              "Hi ahmed,",
              style: AppTextStyles.font16w500,
            ),
            verticalSpace(4),
            Text(
              "I Am Your Smart Coach",
              style: AppTextStyles.font18w700,
            ),
          ],
        )
      ],
    );
  }
}
