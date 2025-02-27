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
import 'chat_view.dart';

class SmartCoachScreen extends StatelessWidget {
  SmartCoachScreen({super.key});

  final viewModel = getIt<SmartCoachScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = _customAppBar(
        context, _getStaredAppBar(context), SmartCoachScreenInitial());
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<SmartCoachScreenViewModel, SmartCoachScreenState>(
          builder: (context, state) {
            if (state is ChatViewState) {
              appBar = _customAppBar(
                  context,
                  Text(
                    context.localization.smartCoach,
                    style: AppTextStyles.font24w800,
                  ),
                  state);
            }
            if(state is SmartCoachScreenInitial){
              appBar = _customAppBar(
                  context,
                  _getStaredAppBar(context),
                  state);
            }
            return BaseScaffold(
              appBar: appBar,
              backGroundPath: AppImages.chatbg,
              body: switch (state) {
                SmartCoachScreenInitial() => GetStartedView(),
                SmartCoachScreenState() => ChatView(),
              },
            );
          },
          listener: (context, state) {}),
    );
  }

  AppBar _customAppBar(
      BuildContext context, Widget title, SmartCoachScreenState state) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: InkWell(
          onTap: () {
            if (state is ChatViewState) {
              viewModel.doAction(GetStartedAction());
            }
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.mainColor),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(AppImages.arrowBack),
            ),
          ),
        ),
      ),
      title: title,
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

  Widget _getStaredAppBar(BuildContext context) {
    return Column(
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
    );
  }
}
