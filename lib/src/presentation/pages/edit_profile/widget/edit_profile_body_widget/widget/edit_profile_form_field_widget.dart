
import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/helpers/validations.dart';
import '../../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../../core/utilities/style/spacing.dart';
import '../../../../../shared/custom_auth_text_form_field.dart';

class EditProfileFormFieldWidget extends StatelessWidget {
  const EditProfileFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: "Name",
          hintText: "Ahmed Mohamed",
          keyboardType: TextInputType.name,
          controller: TextEditingController(),
          validator: (value) => Validations.validateName(value),
          prefixIcon: AppIcons.userIcon,),
        verticalSpace(16),
        CustomTextFormField(
          labelText: "Name",
          hintText: "Ahmed Mohamed",
          keyboardType: TextInputType.name,
          controller: TextEditingController(),
          validator: (value) => Validations.validateName(value),
          prefixIcon: AppIcons.userIcon,),
        verticalSpace(16),
        CustomTextFormField(
          labelText: "omar makram ",
          hintText: "omar makram @gmail.com",
          keyboardType: TextInputType.emailAddress,
          controller: TextEditingController(),
          validator: (value) => Validations.validatePassword(value),
          prefixIcon: AppIcons.emailIcon,),
        verticalSpace(40),
      ],
    );
  }
}
