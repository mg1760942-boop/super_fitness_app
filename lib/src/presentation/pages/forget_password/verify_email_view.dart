import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_icons.dart';
import '../../shared/custom_auth_text_form_field.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

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
              context.localization.enterYourEmail,
              style: AppTextStyles.font18w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.localization.forgetPassword,
              style: AppTextStyles.font20w800,
            ),
          ),
          verticalSpace(16),
          BluredContainer(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            radius: BorderRadius.circular(50),
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: AppIcons.emailIcon,
                  labelText: '',
                  validator: (_) => _viewModel.doAction(GetFieldValidatorAction(
                      field: ForgetPasswordScreenFields.email)),
                  hintText: context.localization.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: _viewModel.doAction(GetFieldControllerAction(
                      field: ForgetPasswordScreenFields.email)),
                ),
                verticalSpace(24),
                CustomAuthButton(
                    textStyle: AppTextStyles.font14w800,
                    text: context.localization.sentOtp,
                    onPressed: () {
                      _viewModel.doAction(VerifyEmailAction());
                    },
                    color: AppColors.mainColor,
                    radius: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}
