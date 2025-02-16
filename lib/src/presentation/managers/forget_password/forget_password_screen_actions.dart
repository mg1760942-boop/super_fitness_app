import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';

sealed class ForgetPasswordScreenActions {}

class ForgetPasswordAction extends ForgetPasswordScreenActions {}
class VerifyResetCodeAction extends ForgetPasswordScreenActions {}
class ResetPasswordAction extends ForgetPasswordScreenActions {}
class GetFieldControllerAction extends ForgetPasswordScreenActions{
  ForgetPasswordScreenFields field;
  GetFieldControllerAction({required this.field});
}
class GetFieldValidatorAction extends ForgetPasswordScreenActions{
  ForgetPasswordScreenFields field;
  GetFieldValidatorAction({required this.field});
}