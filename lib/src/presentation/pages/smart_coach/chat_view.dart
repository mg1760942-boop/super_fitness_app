import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_view_model.dart';

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
            itemCount: viewModel.history.length)
      ],
    );
  }
}
