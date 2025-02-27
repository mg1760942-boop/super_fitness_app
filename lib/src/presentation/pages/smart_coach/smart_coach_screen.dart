import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/pages/smart_coach/get_started_view.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';
import '../../../../core/utilities/style/app_text_styles.dart';
import '../../../../core/utilities/style/spacing.dart';
import '../../../../generated/assets.dart';
import 'chat_view.dart';

class SmartCoachScreen extends StatelessWidget {
  SmartCoachScreen({super.key});

  final viewModel = getIt<SmartCoachScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BaseScaffold(
        appBar: _customAppBar(context),
        backGroundPath: AppImages.chatbg,
        body: BlocConsumer<SmartCoachScreenViewModel, SmartCoachScreenState>(
            builder: (context, state) {
              if (state is StartChatAction) {
                return const ChatView();
              }
              if (state is GetStartedChatState) {
                return GetStartedView();
              }
              return GetStartedView();
            },
            listener: (context, state) {}),
      ),
    );
  }

  AppBar _customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16,right: 8),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(AppImages.arrowBack),
            ),
          ),
        ),
      ),
      title: Column(
        children: [
          Text(
            " ${context.localization.hi} ahmed,",
            style: AppTextStyles.font16w500,
          ),
          verticalSpace(4),
          Text(
            context.localization.iamSmartCoach,
            style: AppTextStyles.font18w700,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(AppImages.cahtHistory),
          ),
        )
      ],
    );
  }
}
