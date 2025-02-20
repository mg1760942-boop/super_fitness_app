import 'package:numberpicker/numberpicker.dart';

import '../../../core/common/common_imports.dart';
import '../../../core/utilities/style/app_colors.dart';
import '../../../core/utilities/style/app_fonts.dart';
import '../../../core/utilities/style/spacing.dart';

class HorizontalNumberPickerWidget extends StatelessWidget {
  final int selectedIndex ;
  final int max ;
  final String titleText;
  final void Function(int) onChanged;


  const HorizontalNumberPickerWidget({super.key, required this.selectedIndex, required this.max, required this.titleText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            titleText,
            style: AppFonts.font12MainWeight400.copyWith(color: AppColors.primary),
          ),
        ),
        verticalSpace(12),
        NumberPicker(
          value:selectedIndex,
          minValue: 1,
          maxValue: max,
          step: 1,

          itemCount: 6,
          itemHeight: 55.h,
          itemWidth: MediaQuery.of(context).size.width / 7,
          axis: Axis.horizontal,
          haptics: false,
          selectedTextStyle: TextStyle(
            fontSize: 44.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,

          ),

          textStyle: TextStyle(
            fontSize: 33.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFFD3D3D3),
          ),
          onChanged:onChanged,
        ),                      verticalSpace(6),
        const Icon(
          Icons.arrow_drop_up,
          size: 30,
          color: Color(0xFFFD3C00),
        ),
      ],
    );
  }
}
