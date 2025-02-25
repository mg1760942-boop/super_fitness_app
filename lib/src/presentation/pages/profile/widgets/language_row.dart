import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_icons.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/spacing.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({
    super.key,
    required this.onTap,
    required this.isEnabled,
    required this.onSelected,
  });

  final void Function() onTap;
  final bool isEnabled;
  final void Function(bool value) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFF2C2C2C)),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.languageIcon,
            color: AppColors.mainColor,
            width: 20.w,
            height: 20.h,
          ),
          horizontalSpace(16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Baloo Thambi 2',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.26,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: '${context.localization.selectLanguage} ('),
                TextSpan(
                  text: isEnabled
                      ? context.localization.english
                      : context.localization.arabic,
                  style: TextStyle(color: AppColors.mainColor),
                ),
                const TextSpan(text: ')'),
              ],
            ),
          ),
          const Spacer(),
          FlutterSwitch(
            value: isEnabled,
            width: 34.0.w,
            height: 20.0.h,
            toggleSize: 18.0,
            borderRadius: 20.0,
            padding: 1.0,
            activeColor: AppColors.mainColor,
            inactiveColor: Colors.grey[400]!,
            onToggle: onSelected,
          ),
        ],
      ),
    );
  }
}
