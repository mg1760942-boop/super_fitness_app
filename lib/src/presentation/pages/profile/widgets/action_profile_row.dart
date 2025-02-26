import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../core/utilities/style/spacing.dart';

class ActionProfileRow extends StatelessWidget {
  const ActionProfileRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final String icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFF2C2C2C)),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: AppColors.mainColor,
              width: 20.w,
              height: 20.h,
            ),
            horizontalSpace(16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.font14w600White,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mainColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
