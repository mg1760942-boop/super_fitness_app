import 'package:wheel_slider/wheel_slider.dart';
import '../../../core/common/common_imports.dart';
import '../../../core/utilities/style/app_colors.dart';
import '../../../core/utilities/style/app_fonts.dart';
import '../../../core/utilities/style/spacing.dart';

class HorizontalNumberPickerWidget extends StatefulWidget {
  final int selectedIndex ;
  final int max ;
  final String titleText;
  final void Function(int) onChanged;


  const HorizontalNumberPickerWidget({super.key, required this.selectedIndex, required this.max, required this.titleText, required this.onChanged});

  @override
  State<HorizontalNumberPickerWidget> createState() => _HorizontalNumberPickerWidgetState();
}

class _HorizontalNumberPickerWidgetState extends State<HorizontalNumberPickerWidget> {
  int selectedIndex = 46;
  final ScrollController _scrollController = ScrollController();
  final double itemWidth = 60;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCenter(selectedIndex, animate: false);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCenter(int index, {bool animate = true}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetOffset = index * itemWidth - screenWidth / 2 + itemWidth / 2;

    if (animate) {
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.jumpTo(targetOffset);
    }
  }

  (double, Color) getFontSize(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double center = _scrollController.offset + screenWidth / 2;
    double itemCenter = index * itemWidth + itemWidth / 2;
    double diff = (itemCenter - center).abs() / itemWidth;

    if (diff <= 0.5) return (44.sp, const Color(0xFFFF4100));
    if (diff <= 1.5) return (32.sp, const Color(0xFFD3D3D3));
    if (diff <= 2.5) return (24.sp, const Color(0xFFD3D3D3));
    return (16.sp, const Color(0xFFD3D3D3));
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            widget.titleText,
            style: AppFonts.font12MainWeight400.copyWith(color: AppColors.primary),
          ),
        ),
        verticalSpace(12),
        WheelSlider.number(
          totalCount: widget.max,
          initValue: widget.selectedIndex,
          unSelectedNumberStyle: TextStyle(
            fontSize: 33.0.sp,
            color: AppColors.kWhiteBase,
            fontWeight: FontWeight.w800,
          ),
          selectedNumberStyle: TextStyle(
            fontSize: 44.0.sp,
            color: AppColors.mainColor,
            fontWeight: FontWeight.w800,
          ),
          currentIndex: widget.selectedIndex,
          onValueChanged:(p0) {

          },
          itemSize: 100,
          isInfinite: true,
          listHeight: 800,
          listWidth: 400,

          animationDuration: Duration(milliseconds: 300),
          animationType: Curves.easeInOut,
          customPointer: Container(),
          horizontal: true,
          scrollPhysics: BouncingScrollPhysics(), // نوع التمرير
          showPointer: true,
          verticalListHeight: 300,
          horizontalListHeight: 100,
          horizontalListWidth: 200,
          verticalListWidth: 100,
          hapticFeedbackType: HapticFeedbackType.selectionClick,
        ),
        // NumberPicker(
        //   value:widget.selectedIndex,
        //   minValue: 1,
        //   maxValue: widget.max,
        //   step: 1,
        //
        //   itemCount: 6,
        //   itemHeight: 55.h,
        //   itemWidth: MediaQuery.of(context).size.width / 7,
        //   axis: Axis.horizontal,
        //   haptics: false,
        //   selectedTextStyle: TextStyle(
        //     fontSize: 44.sp,
        //     fontWeight: FontWeight.w800,
        //     color: AppColors.primary,
        //
        //   ),
        //
        //   textStyle: TextStyle(
        //     fontSize: 33.sp,
        //     fontWeight: FontWeight.w800,
        //     color: const Color(0xFFD3D3D3),
        //   ),
        //   onChanged:widget.onChanged,
        // ),
        verticalSpace(6),
        const Icon(
          Icons.arrow_drop_up,
          size: 30,
          color: Color(0xFFFD3C00),
        ),
      ],
    );
  }
}
