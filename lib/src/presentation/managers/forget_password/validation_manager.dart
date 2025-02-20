
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
    if(password == null || password.isEmpty || password.length < 8){
      return "Password must be at least 8 characters";
    }
    if(!AppRegExp.isPasswordValid(password)){
      return "Invalid password";
    }
    return null;
  }

  String? _confirmPasswordValidator(String? password, String? confirmPassword) {
    if(confirmPassword == null || confirmPassword.isEmpty || confirmPassword.length < 8){
      return "Password must be at least 8 characters";
    }
    if(!AppRegExp.isPasswordValid(confirmPassword)){
      return "Invalid password";
    }
    if(password != confirmPassword){
      return "Passwords do not match";
    }
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