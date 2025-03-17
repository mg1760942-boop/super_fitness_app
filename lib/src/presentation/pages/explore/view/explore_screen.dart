import 'package:flutter_svg/svg.dart';
import 'package:super_fitness_app/core/utilities/style/app_fonts.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/core/utilities/style/images/cached_network_image%20_widget.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/domain/entities/home/category_model.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../widget/category/category_widget.dart';
import '../widget/popular/popular_button_widget.dart';
import '../widget/popular/popular_list_widget.dart';
import '../widget/popular/popular_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 52.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        // Text("Hi Ahmed ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColors.kWhiteBase),),
        //  //verticalSpace(5),
        // Text(" Let’s start your day ",style: TextStyle(
        //     fontSize: 18.sp,
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.kWhiteBase),),
    // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //  title:
          //  Text("Hi Ahmed ",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w800,color: AppColors.kWhiteBase),
          //  //  style: AppFonts.font16KWightWeightW500Font,
          //  ),
          //  subtitle: Text(" Let’s start your day",style: AppFonts.font18KWightWeightW500Font,),
          // )
          verticalSpace(40),
          CategoryWidget(),
          verticalSpace(33),
          Text("Recommendation To Day",style: AppFonts.font16KWightWeightW60Font,),
          verticalSpace(8),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CachedNetworkImageWidget(
                  imageUrl: "https://www.themealdb.com/images/category/beef.png",
                  width: 104.w,
                  height: 104.h,
              fit: BoxFit.cover,),
              Container(
                width: 104.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
              )
            ],
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Upcoming Workouts",style: AppFonts.font16KWightWeightW60Font,),
              Text("See All",style: AppFonts.font14KWightPrimaryW400Font,),
            ],
          ),
          verticalSpace(24),
           Text("Recommendation For You",style: AppFonts.font16KWightWeightW60Font,),
           
          verticalSpace(24),
          PopularWidget(),




        ],
      ),
    );
  }
}
