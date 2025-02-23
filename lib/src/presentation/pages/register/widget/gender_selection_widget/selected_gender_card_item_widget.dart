import 'package:flutter_svg/svg.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class SelectedGenderCardItemWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final String image;
  const SelectedGenderCardItemWidget({super.key, required this.text,  this.isSelected =false, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return       InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(30.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Color(0xFFFF4100) : Colors.transparent,
            border: Border.all(
              color: const Color(0xFFD9D9D9),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              SvgPicture.asset(image,width: 37.5.w,height: 51.09.h,),
              verticalSpace(8),
              Text(text,style: AppFonts.font14KWightWeightW800Font,)
            ],
          )),
    );
  }
}
