import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/pages/register/widget/register_form_field_widget.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../shared/blured_container.dart';
import '../../../shared/custom_auth_button.dart';
import '../../login/widgets/auth_decission_row.dart';

class RegisterBodyFormWidget extends StatelessWidget {
  const RegisterBodyFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hey There",
                style: AppFonts.font18KWightWeightW400Font,
              ),
              verticalSpace(2),
              Text(
                "CREATE AN ACCOUNT",
                style: AppFonts.font20KWightWeightW800Font,
              ),
              verticalSpace(32),
            ],
          ),
        ),

        BluredContainer(
          radius: BorderRadius.all(Radius.circular(50)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(children: [
            Text(
              "Register",
              style: AppFonts.font20KWightWeightW800Font,
            ),
            verticalSpace(16),
            RegisterFormFieldWidget(),
            verticalSpace(22),
            CustomAuthButton(
              text: context.localization.login,
              onPressed: () {},
              color: Color(0xFFFF4100),
              textColor: Colors.white,
              radius: 20,
            ),
            verticalSpace(8),
            AuthDecissionRow(
                text: context.localization.login,
                onPressed: () {},
                prefixText: context.localization.dontHaveAnAccountRegister),
          ]),
        ),
      ],
    );
  }
}
