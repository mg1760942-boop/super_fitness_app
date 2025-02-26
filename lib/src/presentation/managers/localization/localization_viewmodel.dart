import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/shared_pref/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref/shared_pref_keys.dart';

part 'localization_state.dart';

class LocalizationViewmodel extends Cubit<LocalizationState> {
  LocalizationViewmodel() : super(LocalizationInitial());
  String cachedLanguageCode = "en";
  Future<void> getSavedLanguage() async {
    String? index = await SharedPrefHelper.getString(SharedPrefKeys.language);
    if (index != null && index.isNotEmpty) {
      cachedLanguageCode = index;
    }
    emit(ChangLocalizationState());
  }

  Future<void> cachingLanguageCode({required String languageCode}) async {
    if (cachedLanguageCode == languageCode) {
      return;
    }
    await SharedPrefHelper.setDate(SharedPrefKeys.language, languageCode);
    getSavedLanguage();
  }

  bool isEnglishLanguage() {
    return cachedLanguageCode == "en";
  }
}
