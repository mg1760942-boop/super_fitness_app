import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';

@singleton
@injectable
class ForgetPasswordScreenControllerManger {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  getController(ForgetPasswordScreenFields field) {
    switch (field) {
      case ForgetPasswordScreenFields.email:
        return _emailController;
      case ForgetPasswordScreenFields.code:
        return _codeController;
      case ForgetPasswordScreenFields.newPassword:
        return _newPasswordController;
      case ForgetPasswordScreenFields.confirmNewPassword:
        return _confirmPasswordController;
    }
  }
}
