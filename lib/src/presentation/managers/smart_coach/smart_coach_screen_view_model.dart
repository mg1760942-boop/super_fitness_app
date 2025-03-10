import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/usecases/smart_coach/send_message_use_case.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';

import '../../../domain/smart_coach/smart_coach_creator.dart';

@injectable
class SmartCoachScreenViewModel extends Cubit<SmartCoachScreenState> {
  final SendMessageUseCase _sendMessageUseCase;

  SmartCoachScreenViewModel(this._sendMessageUseCase)
      : super(SmartCoachScreenInitial());
  List<Content> history = [];
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  SmartCoachType type = SmartCoachType.gemini;

  _sendMessage(String message) async {
    if (message.isEmpty || message == null) {
      return;
    }
    history.add(Content.text(message));
    emit(SendMessageState());
    controller.clear();
    var result = await _sendMessageUseCase.smartCoach(type, message);
    switch (result) {
      case Success<void>():
        emit(SmartCoachSuccessResponseState());
        break;
      case Failures<void>():
        emit(SmartCoachFailResponseState());
        break;
    }
  }

  doAction(SmartCoachScreenActions action) {
    switch (action) {
      case StartChatAction():
        emit(ChatViewState());
        break;
      case GetStartedAction():
        emit(SmartCoachScreenInitial());
        break;
      case SendMessageAction():
        _sendMessage(action.message!);
        break;
    }
  }
}
