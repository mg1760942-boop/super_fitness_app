sealed class SmartCoachScreenActions{}
class StartChatAction extends SmartCoachScreenActions{}
class GetStartedAction extends SmartCoachScreenActions{}
class SendMessageAction extends SmartCoachScreenActions{
  final String? message;
  SendMessageAction(this.message);
}
