import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/helpers/validations.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../shared/custom_auth_text_form_field.dart';

class RegisterFormFieldWidget extends StatelessWidget {
  const RegisterFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel = context.read<RegisterViewModel>();
    return Form(
      key: registerViewModel.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: "First Name",
            hintText: "First Name",
            keyboardType: TextInputType.name,
            controller: registerViewModel.firstNameController,
            validator: (value) => Validations.validateName(value),

            prefixIcon: AppIcons.userIcon,
          ),
          verticalSpace(16),
          CustomTextFormField(
            controller: registerViewModel.lastNameController,
            labelText: "Last Name",
            hintText: "Last Name",
            keyboardType: TextInputType.name,
            validator: (value) => Validations.validateName(value),

            prefixIcon: AppIcons.userIcon,
          ),
          verticalSpace(16),
          CustomTextFormField(
            labelText: "Email",
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            controller: registerViewModel.emailController,
            validator: (value) => Validations.validateEmail(value),
            prefixIcon: AppIcons.emailIcon,
          ),
          verticalSpace(16),
          BlocBuilder<RegisterViewModel, RegisterState>(
            builder: (context, state) {
              return CustomTextFormField(
                isPasswordVisible: registerViewModel.isShowConfirmPassword,
                showPassword: () => registerViewModel.changePasswordVisible(),
                hintText: context.localization.password,
                keyboardType: TextInputType.visiblePassword,
                controller:registerViewModel.passwordController,
                labelText: context.localization.password,
                validator: (value) => Validations.validatePassword(value),
                prefixIcon: AppIcons.passwordIcon,
              );
            },
          ),
        ],
      ),
    );
  }
}
