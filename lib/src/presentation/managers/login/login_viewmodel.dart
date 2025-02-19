import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/login/login_usecase.dart';

part 'login_state.dart';

@injectable
class LoginViewmodel extends Cubit<LoginState> {
  LoginUsecase loginUsecase;
  LoginViewmodel(this.loginUsecase) : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool validate = false;

  void validateFields() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      validate = false;
    } else if (!formKey.currentState!.validate()) {
      validate = false;
    } else {
      validate = true;
    }
    emit(ValidateFieldsState());
  }

  Future<void> login() async {
    if (validate) {
      emit(LoginLoadingState());
      var result = await loginUsecase.login(
          emailController.text, passwordController.text);
      switch (result) {
        case Success<void>():
          emit(LoginSuccessState());
        case Failures<void>():
          emit(LoginErrorState(result.exception));
      }
    }
  }
}
