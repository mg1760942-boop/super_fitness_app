import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
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
    return Stack(
      children: [
        ListView.separated(
            controller: viewModel.scrollController,
            reverse: true,
            itemBuilder: (context, index) {
              var content = viewModel.history.reversed.toList()[index];
              var text = content.parts
                  .whereType<TextPart>()
                  .map<String>((e) => e.text)
                  .join('');
              return Text(text);
            },
            separatorBuilder: (context, index) => verticalSpace(8),
            itemCount: viewModel.history.length),
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
              validator: (value) {
                viewModel
                    .doAction(SendMessageAction(viewModel.controller.text));
              },
            ),
          ),
        ),
        horizontalSpace(8),
        InkWell(
          onTap: () {},
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
              Icons.send_rounded,
              color: AppColors.kWhiteBase,
            ),
          ),
        ),
      ],
    );
  }
}
