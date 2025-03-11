import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_text_form_field.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/spacing.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
  }

  void _scrollDown(SmartCoachScreenViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => viewModel.scrollController.animateTo(
          viewModel.scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 750),
          curve: Curves.easeOutCirc),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SmartCoachScreenViewModel>();
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              controller: viewModel.scrollController,
              reverse: true,
              itemBuilder: (context, index) {
                var content = viewModel.history.reversed.toList()[index];
                var text = content.parts
                    .whereType<TextPart>()
                    .map<String>((e) => e.text)
                    .join('');
                return _handelChatViewMessages(
                    content.role.toString(), text, index);
              },
              separatorBuilder: (context, index) => verticalSpace(8),
              itemCount: viewModel.history.length),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: context.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(top: BorderSide(color: AppColors.kGray)),
              ),
              child: _sendMessageRowView(context)),
        )
      ],
    );
  }

  Widget _sendMessageRowView(BuildContext context) {
    final viewModel = context.read<SmartCoachScreenViewModel>();
    IconData iconData = Icons.send_rounded;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 55.h,
            child: CustomTextFormField(
              labelText: "",
              hintText: context.localization.howCatIAssistYou,
              keyboardType: TextInputType.text,
              controller: viewModel.controller,
              validator: (value) {},
            ),
          ),
        ),
        horizontalSpace(8),
        BlocBuilder<SmartCoachScreenViewModel, SmartCoachScreenState>(
          builder: (context, state) {
            if (state is SendMessageState) {
              iconData = Icons.blur_circular;
            }
            if (state is SmartCoachSuccessResponseState) {
              iconData = Icons.send_rounded;
            }
            return InkWell(
              onTap: () {
                viewModel
                    .doAction(SendMessageAction(viewModel.controller.text));
                _scrollDown(viewModel);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      )
                    ]),
                child: Icon(
                  iconData,
                  color: AppColors.kWhiteBase,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _handelChatViewMessages(String role, String text, int? index) {
    return role == "bot"
        ? _messageSmartCoachCard(text, index ?? 0)
        : _messageUserCard(text);
  }

  Widget _messageUserCard(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: context.width * 0.5,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          style: AppTextStyles.font16w500,
        ),
      ),
    );
  }

  Widget _messageSmartCoachCard(String text, int index) {
    final viewModel = context.read<SmartCoachScreenViewModel>();
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: context.width * 0.5,
        decoration: BoxDecoration(
          color: AppColors.kGray,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: index == 0
            ? AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    text,
                    textStyle: AppTextStyles.font16w500,
                    speed: Duration(milliseconds: 10),
                  ),
                ],
              )
            : Text(
                text,
                style: AppTextStyles.font16w500,
              ),
      ),
    );
  }
}
