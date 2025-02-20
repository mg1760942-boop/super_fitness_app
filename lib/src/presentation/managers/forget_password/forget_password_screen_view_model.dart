import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/forget_password/forget_password_use_case.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/controller_manager.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/validation_manager.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/forget_password_screen.dart';

@injectable
class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordScreenStates> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ForgetPasswordScreenControllerManger _controllerManger;
  final ForgetPasswordScreenValidatorManager _validatorManager;

  ForgetPasswordScreenViewModel(this._forgetPasswordUseCase,
      this._controllerManger, this._validatorManager)
      : super(ForgetPasswordScreenInitialState());

  _getController(ForgetPasswordScreenFields field) {
    return _controllerManger.getController(field);
  }

  _getValidator(ForgetPasswordScreenFields field) {
    if (field == ForgetPasswordScreenFields.confirmNewPassword) {
      return _validatorManager.getValidator(
          field,
          _controllerManger
              .getController(ForgetPasswordScreenFields.newPassword)
              .text,
          _controllerManger
              .getController(ForgetPasswordScreenFields.confirmNewPassword)
              .text);
    }
    return _validatorManager.getValidator(
        field, _controllerManger.getController(field).text, null);
  }

  _forgetPassword() async {
    if(_getValidator(ForgetPasswordScreenFields.email) != null){
      emit(ForgetPasswordScreenErrorState(Exception(_getValidator(ForgetPasswordScreenFields.email))));
      return;
    }
    emit(ForgetPasswordScreenLoadingState(message: "sending Otp"));
    String email = _getController(ForgetPasswordScreenFields.email).text;
    log("email: $email");
    var result = await _forgetPasswordUseCase.forgetPassword(
        ForgetPasswordRequestEntity(
            email: email));
    switch (result) {
      case Success<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordScreenSuccessState(message: "Otp sent successfully",view: ForgetPasswordScreenViews.confirmOtpView));
        break;
      case Failures<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordScreenErrorState(result.exception));
        break;
    }
  }

  _verifyResetCode(String? otpCode) async {
    if(otpCode == null || otpCode.isEmpty || otpCode.length < 6){
      return;
    }
    emit(ForgetPasswordScreenLoadingState());
    var result = await _forgetPasswordUseCase.verifyResetCode(
        VerifyResetCodeRequestEntity(
            resetCode: otpCode));
    switch (result) {
      case Success<VerifyResetCodeResponseEntity>():
        emit(ForgetPasswordScreenSuccessState(message: "Code verified successfully",view: ForgetPasswordScreenViews.resetPasswordView));
        break;
      case Failures<VerifyResetCodeResponseEntity>():
        emit(ForgetPasswordScreenErrorState(result.exception));
        break;
    }
  }

  _resetPassword() async {
    if(_getValidator(ForgetPasswordScreenFields.newPassword) != null || _getValidator(ForgetPasswordScreenFields.confirmNewPassword)!= null){
      emit(ForgetPasswordScreenErrorState(Exception("Invalid password")));
      return;
    }
    emit(ForgetPasswordScreenLoadingState());
    String email = _getController(ForgetPasswordScreenFields.email).text;
    String newPassword = _getController(ForgetPasswordScreenFields.newPassword).text;
    var result = await _forgetPasswordUseCase.resetPassword(
      ResetPasswordRequestEntity(email: email, newPassword: newPassword)
    );
    switch (result) {
      case Success<ResetPasswordResponseEntity>():
        emit(ForgetPasswordScreenSuccessState(message: "Password reset successfully",));
        break;
      case Failures<ResetPasswordResponseEntity>():
        emit(ForgetPasswordScreenErrorState(result.exception));
        break;
    }
  }


  doAction(ForgetPasswordScreenActions action) {
    switch (action) {
      case VerifyEmailAction():
        _forgetPassword();
        break;
      case VerifyResetCodeAction():
        _verifyResetCode(action.otpCode);
        break;
      case ResetPasswordAction():
        _resetPassword();
        break;
      case GetFieldControllerAction():
       return _getController(action.field);
      case GetFieldValidatorAction():
        return _getValidator(action.field);
      case OtpResendAction():
        _forgetPassword();
        break;
    }
  }
}

enum ForgetPasswordScreenFields { email, code, newPassword, confirmNewPassword }
