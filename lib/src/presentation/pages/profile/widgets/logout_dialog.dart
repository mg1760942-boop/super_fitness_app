import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/managers/profile/profile_viewmodel.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../shared/custom_auth_button.dart';

class LogoutDialog extends StatelessWidget {
  final ProfileViewmodel viewModel;

  const LogoutDialog({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900]!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300.w,
        height: 180.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localization.logoutMessage,
              style: AppTextStyles.font20w600White,
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomAuthButton(
                    text: context.localization.no,
                    textStyle: AppTextStyles.font14w800,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.kBlackBase,
                    radius: 200,
                    borderColor: AppColors.mainColor,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  child: CustomAuthButton(
                    text: context.localization.yes,
                    textStyle: AppTextStyles.font14w800,
                    onPressed: () {
                      viewModel.logout();
                      Navigator.pop(context);
                    },
                    color: AppColors.mainColor,
                    radius: 200,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
