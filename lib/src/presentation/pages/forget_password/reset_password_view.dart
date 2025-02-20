import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/forget_password/forget_password_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_text_form_field.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_text_styles.dart';
import '../../../../generated/assets.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModle = context.read<ForgetPasswordScreenViewModel>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(88),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.localization.makeSureItis8Characters,
              style: AppTextStyles.font18w400,
            ),
          ),
          verticalSpace(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.localization.createNewPassword,
              style: AppTextStyles.font20w800,
            ),
          ),
          verticalSpace(16),
          BluredContainer(
              radius: BorderRadius.circular(50),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  CustomTextFormField(
                    prefixIcon: Assets.iconsLock,
                    suffixIcon: Assets.iconsEye,
                    labelText: "",
                    hintText: context.localization.password,
                    keyboardType: TextInputType.text,
                    controller: _viewModle.doAction(GetFieldControllerAction(
                        field: ForgetPasswordScreenFields.newPassword)),
                    validator: (_) => _viewModle.doAction(
                      GetFieldValidatorAction(
                          field: ForgetPasswordScreenFields.newPassword),
                    ),
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    prefixIcon: Assets.iconsLock,
                    suffixIcon: Assets.iconsEye,
                    labelText: "",
                    hintText: context.localization.confirmedPassword,
                    keyboardType: TextInputType.text,
                    controller: _viewModle.doAction(GetFieldControllerAction(
                        field: ForgetPasswordScreenFields.confirmNewPassword)),
                    validator: (_) => _viewModle.doAction(
                      GetFieldValidatorAction(
                          field: ForgetPasswordScreenFields.confirmNewPassword),
                    ),
                  ),
                  verticalSpace(24),
                  CustomAuthButton(
                      textStyle: AppTextStyles.font14w800,
                      text: context.localization.done,
                      onPressed: () {
                        _viewModle.doAction(ResetPasswordAction());
                      },
                      color: AppColors.mainColor,
                      radius: 20)
                ],
              ))
        ],
      ),
    );
  }
}
