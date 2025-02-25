import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_font_weights.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle font16Medium = TextStyle(
      fontSize: 16.sp,
      color: AppColors.kWhiteBase,
      fontWeight: AppFontWeights.medium);

  static TextStyle font16Regular = TextStyle(
      fontSize: 16.sp,
      color: AppColors.kBlack,
      fontWeight: AppFontWeights.normal);
  static TextStyle font20Medium = TextStyle(
      fontSize: 20.sp,
      color: AppColors.kBlack,
      fontWeight: AppFontWeights.medium);
  static TextStyle font12w400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font12w500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font18Medium = TextStyle(
      fontSize: 18.sp,
      color: AppColors.kBlack,
      fontWeight: AppFontWeights.medium);

  static TextStyle font14Regular = TextStyle(
      fontSize: 14.sp,
      color: AppColors.kBlack,
      fontWeight: AppFontWeights.normal);
  static TextStyle font14RegularWhite = TextStyle(
      fontSize: 14.sp,
      color: AppColors.kWhite70,
      fontWeight: AppFontWeights.normal);
  static TextStyle font16RegularWhite = TextStyle(
      fontSize: 16.sp,
      color: AppColors.kWhite70,
      fontWeight: AppFontWeights.normal);
  static TextStyle font12Regular = TextStyle(
      fontSize: 12.sp,
      color: AppColors.kBlack,
      fontWeight: AppFontWeights.normal);
  static TextStyle font11Regular = TextStyle(
      fontSize: 11.sp,
      color: AppColors.kGray,
      fontWeight: AppFontWeights.normal);
  static var font18w400 = GoogleFonts.balooThambi2(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    color: AppColors.kWhiteBase,
  );
  static var font20w800 = GoogleFonts.balooThambi2(
    fontWeight: FontWeight.w800,
    fontSize: 20.sp,
    color: AppColors.kWhiteBase,
  );
  static var font14w800 = GoogleFonts.balooThambi2(
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
    color: AppColors.kWhiteBase,
  );
  static var font16w400 = GoogleFonts.balooThambi2(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.kWhiteBase,
  );
  static var font16w700 = GoogleFonts.balooThambi2(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
  );
  static var font20w500 = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.mainColor);
  static var font26BoldWhite = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.mainColor);
  static var font22BoldWhite = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.mainColor);
}
