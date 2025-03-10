import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/core/constants/api_keys.dart';
import '../../../domain/smart_coach/smart_coach_model.dart';

@Injectable(as: SmartCoachModel)
class Gemini implements SmartCoachModel {
  GenerativeModel? model;
  ChatSession? chat;

  Gemini() {
    model = GenerativeModel(
      model: "gemini-2.0-flash",
      apiKey: ApiKey.googleApiKey,
    );
    chat = model?.startChat();
  }

  @override
  Future<dynamic> sendMessage(String message) async {
    return chat?.sendMessageStream(Content.text(message));
  }
}
