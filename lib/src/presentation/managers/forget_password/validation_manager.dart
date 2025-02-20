
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/helpers/app_regexp.dart';

import 'forget_password_screen_view_model.dart';

@singleton
@injectable
class ForgetPasswordScreenValidatorManager{

  String? _emailValidator(String? email){
    if(email == null || email.isEmpty || !AppRegExp.isEmailValid(email)){
      return "Invalid email";
    }
    return null;
  }
  String? _fieldValidator(String? text) {
    return null;
  }
  String? _passwordValidator(String? password){
    return null;
  }

  String? _confirmPasswordValidator(String? password, String? confirmPassword) {
    return null;
  }

  String? _codeValidator(String? code) {
    return null;
  }

  String? getValidator(ForgetPasswordScreenFields field, String? text,String? confirmText){
    switch (field) {
      case ForgetPasswordScreenFields.email:
        return _emailValidator(text);
      case ForgetPasswordScreenFields.code:
       return _codeValidator(text);
      case ForgetPasswordScreenFields.newPassword:
        return _passwordValidator(text);
      case ForgetPasswordScreenFields.confirmNewPassword:
        return _confirmPasswordValidator(text,confirmText);
    }
  }

}