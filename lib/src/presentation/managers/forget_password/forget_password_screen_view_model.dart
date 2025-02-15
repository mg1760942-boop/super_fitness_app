import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/forget_password/forget_password_use_case.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';

@injectable
class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordScreenStates> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordScreenViewModel(this._forgetPasswordUseCase)
      : super(ForgetPasswordScreenInitialState());
}
