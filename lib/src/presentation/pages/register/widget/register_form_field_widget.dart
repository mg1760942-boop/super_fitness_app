import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_icons.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../shared/custom_auth_text_form_field.dart';

class RegisterFormFieldWidget extends StatelessWidget {
  const RegisterFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: "First Name",
          hintText: "First Name",
          keyboardType: TextInputType.name,
          controller:TextEditingController(),
          validator: (value) {
          },
          prefixIcon: AppIcons.userIcon,
        ),
        verticalSpace(16),
        CustomTextFormField(
          labelText: "First Name",
          hintText: "First Name",
          keyboardType: TextInputType.name,
          controller:TextEditingController(),
          validator: (value) {
          },
          prefixIcon: AppIcons.userIcon,
        ),
        verticalSpace(16),
        CustomTextFormField(
          labelText: "First Name",
          hintText: "First Name",
          keyboardType: TextInputType.name,
          controller:TextEditingController(),
          validator: (value) {
          },
          prefixIcon: AppIcons.emailIcon,
        ),
        verticalSpace(16),
        CustomTextFormField(
          isPasswordVisible: true,
          showPassword: () {},
          hintText: context.localization.password,
          keyboardType: TextInputType.visiblePassword,
          controller: TextEditingController(),
          labelText: context.localization.password,
          validator: (val) {
          },
          prefixIcon: AppIcons.passwordIcon,
        ),
      ],
    );
  }
}
