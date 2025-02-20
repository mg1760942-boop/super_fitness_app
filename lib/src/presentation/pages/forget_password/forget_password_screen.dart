import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/login/login_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/verify_email_view.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';
import '../../../../generated/assets.dart';
import '../../managers/forget_password/forget_password_screen_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final viewModel = getIt<ForgetPasswordScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BaseScaffold(
        appBar: _appBar(),
        backGroundPath: AppImages.backgroundScafSec,
        body: BlocConsumer<ForgetPasswordScreenViewModel,
                ForgetPasswordScreenStates>(
            builder: (context, state) {
              if(state is ForgetPasswordScreenSuccessState){
                switch(state.view){
                  case null:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case ForgetPasswordScreenViews.verifyEmailView:
                    return VerifyEmailView();
                  case ForgetPasswordScreenViews.confirmOtpView:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case ForgetPasswordScreenViews.resetPasswordView:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                }
              }
              return VerifyEmailView();
            },
            listener: (context, state) {
              if(state is LoginLoadingState){

              }
            }),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarOpacity: 1.0,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        Assets.imagesAppIcon,
        height: 48.h,
        width: 70.w,
      ),
    );
  }
}

enum ForgetPasswordScreenViews {
  verifyEmailView,
  confirmOtpView,
  resetPasswordView
}
