import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/core/utilities/dialogs/awesome_dialoge.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/data/api/core/errors/error_handler.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_states.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/confirm_otp_view.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/reset_password_view.dart';
import 'package:super_fitness_app/src/presentation/pages/forget_password/verify_email_view.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';
import '../../../../generated/assets.dart';
import '../../managers/forget_password/forget_password_screen_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final viewModel = getIt<ForgetPasswordScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    Widget _currentView = VerifyEmailView();
    return BlocProvider(
      create: (_) => viewModel,
      child: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment
          return Center(
            child: SpinKitCubeGrid(
              color: AppColors.mainColor,
            ),
          );
        },
        child: BaseScaffold(
          appBar: _appBar(),
          backGroundPath: AppImages.backgroundScafSec,
          body: BlocConsumer<ForgetPasswordScreenViewModel,
              ForgetPasswordScreenStates>(builder: (context, state) {
            if (state is ForgetPasswordScreenSuccessState) {
              switch (state.view) {
                case null:
                  return VerifyEmailView();
                case ForgetPasswordScreenViews.verifyEmailView:
                  _currentView = VerifyEmailView();
                  return VerifyEmailView();
                case ForgetPasswordScreenViews.confirmOtpView:
                  _currentView = ConfirmOtpView();
                  return ConfirmOtpView();
                case ForgetPasswordScreenViews.resetPasswordView:
                  _currentView = ResetPasswordView();
                  return ResetPasswordView();
              }
            }
            return _currentView;
          }, listener: (context, state) {
            context.loaderOverlay.hide();
            if (state is ForgetPasswordScreenLoadingState) {
              context.loaderOverlay.show();
            }
            if (state is ForgetPasswordScreenSuccessState) {
              context.loaderOverlay.hide();
              showAwesomeDialog(context,
                  title: 'Success',
                  desc: state.message ?? "Success",
                  onOk: () {},
                  dialogType: DialogType.success);
              //showSuccessToast(state.message??"Success", context);
            }
            if (state is ForgetPasswordScreenErrorState) {
              context.loaderOverlay.hide();
              showAwesomeDialog(context,
                  title: 'Error',
                  desc: ErrorHandler.fromException(
                          state.exception!, AppLocalizations.of(context)!)
                      .errorMessage,
                  onOk: () {},
                  dialogType: DialogType.error);
              //showErrorToast(state, context);
            }
            if (state is CompleteResetPasswordState) {
              //showSuccessToast(state.message??"Success", context);
              navKey.currentState!.pushNamed(PageRoutesName.login);
            }
          }),
        ),
      ),
    );
  }

  // void showErrorToast(ForgetPasswordScreenErrorState state, BuildContext context) {
  //     CherryToast.error(
  //     description: Text(
  //       ErrorHandler.fromException(
  //               state.exception!, AppLocalizations.of(context)!)
  //           .errorMessage,
  //       style: AppTextStyles.font14w800.copyWith(color: AppColors.error),
  //     ),
  //     toastPosition: Position.bottom,
  //     animationType: AnimationType.fromBottom,
  //     animationDuration: const Duration(milliseconds: 1000),
  //     autoDismiss: true,
  //   ).show(context);
  // }
  //
  // void showSuccessToast(String message, BuildContext context) {
  //     CherryToast.success(
  //     description: Text(
  //       message!,
  //       style: AppTextStyles.font14w800.copyWith(color: AppColors.kSuccess)
  //     ),
  //     toastPosition: Position.bottom,
  //     animationType: AnimationType.fromBottom,
  //     animationDuration: const Duration(milliseconds: 1000),
  //     autoDismiss: true,
  //   ).show(context);
  // }

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
  resetPasswordView,
}
