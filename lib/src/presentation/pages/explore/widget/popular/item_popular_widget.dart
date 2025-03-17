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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200.w,
            height: 179.h,
            decoration: BoxDecoration(
              color: AppColors.kBlack,
              borderRadius: BorderRadius.circular(10),
            ),

          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Exercises That  Strengthen Your Chest",
                  textAlign: TextAlign.center,
                  style: AppFonts.font14KWightWeight600Font,
                ),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopularButtonWidget(
                      title: "24 Tasks",
                      colorText: AppColors.kWhiteBase,
                    ),
                    PopularButtonWidget(
                      title: "24 Tasks",
                      colorText: AppColors.mainColor,
                    ),

                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
