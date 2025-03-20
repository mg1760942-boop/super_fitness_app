import 'package:super_fitness_app/src/presentation/pages/explore/widget/popular/popular_button_widget.dart';
import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_colors.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class ItemPopularWidget extends StatelessWidget {
  const ItemPopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return        SizedBox(
      width: 200.w,
      height: 179.h,
      child: Container(
        width: 200,
        height: 176,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.black.withValues(alpha: 128),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 96,
              child: SizedBox(
                width: 200,
                child: Text(
                  'exercises that              strengthen your Chest',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Baloo Thambi 2',
                    fontWeight: FontWeight.w600,
                    height: 1.20,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 138,
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: Color(0x7F242424),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            '24 tasks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Baloo Thambi 2',
                              fontWeight: FontWeight.w400,
                              height: 1.20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: Color(0x7F242424),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            'Beginner ',
                            style: TextStyle(
                              color: Color(0xFFFF4100),
                              fontSize: 12,
                              fontFamily: 'Baloo Thambi 2',
                              fontWeight: FontWeight.w700,
                              height: 1.20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
