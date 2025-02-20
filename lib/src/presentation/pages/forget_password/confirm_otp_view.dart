import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../../../core/common/common_imports.dart';
import '../../managers/forget_password/forget_password_screen_actions.dart';
import '../../managers/forget_password/forget_password_screen_view_model.dart';

class ConfirmOtpView extends StatefulWidget {
  const ConfirmOtpView({super.key});

  @override
  State<ConfirmOtpView> createState() => _ConfirmOtpViewState();
}

class _ConfirmOtpViewState extends State<ConfirmOtpView> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  int _resentOtpWaitingTimer = 10;
  String? otpCode;
  int _seconds = 10 * 60;
  Timer? _timer;
  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  _clearOtp() {
    for (var controller in _controllers) {
      controller.clear();
    }
    for (var focusNode in _focusNodes) {
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<ForgetPasswordScreenViewModel>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(88),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.localization.otpCode,
              style: AppTextStyles.font20w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.localization.enterOtp,
              style: AppTextStyles.font18w400,
            ),
          ),
          verticalSpace(16),
          BluredContainer(
            radius: BorderRadius.circular(50),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) => _otpBox(index)),
                ),
                verticalSpace(24),
                CustomAuthButton(
                    textStyle: AppTextStyles.font14w800,
                    text: context.localization.confirm,
                    onPressed: () {
                      if (otpCode == null || otpCode!.length < 6) {
                        return;
                      } else {
                        _viewModel
                            .doAction(VerifyResetCodeAction(otpCode: otpCode!));
                      }
                    },
                    color: AppColors.mainColor,
                    radius: 20),
                verticalSpace(8),
                Text(
                  context.localization.didntreciveCode,
                  style: AppTextStyles.font16w400,
                ),
                verticalSpace(4),
                InkWell(
                    onTap: () {
                      _clearOtp();
                      _viewModel.doAction(OtpResendAction());
                      setState(() {
                        _seconds = _resentOtpWaitingTimer * 60;
                        startTimer();
                      });
                    },
                    child: Text(
                      _seconds != 0
                          ? formatTime(_seconds)
                          : context.localization.resendCode,
                      style: AppTextStyles.font16w700.copyWith(
                          color: AppColors.mainColor,
                          decoration: _seconds != 0
                              ? TextDecoration.none
                              : TextDecoration.underline,decorationColor: AppColors.mainColor),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 50.w,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              setState(() {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              });
            } else {
              final otp =
                  _controllers.map((controller) => controller.text).join();
              if (index == 5) {
                otpCode = otp;
              }
            }
          } else if (value.isEmpty && index > 0) {
            _controllers[index].text = "";
            setState(() {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            });
          }
        },
        textAlign: TextAlign.center,
        style: AppTextStyles.font20w500,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "", // Removes the default counter
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: _controllers[index].text.isNotEmpty
                    ? AppColors.mainColor
                    : AppColors.kWhiteBase,
                width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor, width: 2)),
        ),
      ),
    );
  }
}
