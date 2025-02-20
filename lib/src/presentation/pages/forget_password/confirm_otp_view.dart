import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../../../core/common/common_imports.dart';

class ConfirmOtpView extends StatefulWidget {
  const ConfirmOtpView({super.key});

  @override
  State<ConfirmOtpView> createState() => _ConfirmOtpViewState();
}

class _ConfirmOtpViewState extends State<ConfirmOtpView> {
  @override
  Widget build(BuildContext context) {
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
                  children: List.generate(6, (index) => _otpBox()),
                ),
                verticalSpace(24),
                CustomAuthButton(
                    textStyle: AppTextStyles.font14w800,
                    text: context.localization.confirm,
                    onPressed: () {},
                    color: AppColors.mainColor,
                    radius: 20),
                verticalSpace(8),
                Text(
                  context.localization.didntreciveCode,
                  style: AppTextStyles.font16w400,
                ),
                verticalSpace(4),
                Text(
                  context.localization.resendCode,
                  style: AppTextStyles.font16w700
                      .copyWith(color: AppColors.mainColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpBox() {
    return SizedBox(
      width: 50.w,
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.red, // Matches your design
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        // Limits input to one digit
        decoration:  InputDecoration(
          counterText: "", // Removes the default counter
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.kWhiteBase, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor, width: 2),
          ),
        ),
      ),
    );
  }
}
