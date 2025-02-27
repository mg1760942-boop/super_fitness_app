

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/domain/usecases/smart_coach/send_message_use_case.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';

import '../../../domain/smart_coach/smart_coach_creator.dart';

@injectable
class SmartCoachScreenViewModel extends Cubit<SmartCoachScreenState>{
  // final SendMessageUseCase _sendMessageUseCase;
  // SmartCoachScreenViewModel(@factoryParam SmartCoach type, SmartCoachCreator creator)
  //     : _sendMessageUseCase = SendMessageUseCase(SmartCoach.gemini, creator), super(SmartCoachScreenInitial());

  SmartCoachScreenViewModel() : super(SmartCoachScreenInitial());
  List<Content> history = [];
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();


  // _sendMessage(String message){
  //   if(message.isEmpty || message == null){
  //     return;
  //   }
  //   var result = _sendMessageUseCase.smartCoach(message);
  //   switch (result) {
  //
  //   }
  // }
  doAction(SmartCoachScreenActions action){
    switch (action) {
      case StartChatAction():
        emit(ChatViewState());
        break;
      case GetStartedAction():
        emit(SmartCoachScreenInitial());
        break;
      case SendMessageAction():
        // _sendMessage(action.message!);
       break;
    }
  }

}