import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF242424),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SizedBox(
            width: 150.w,
            height: 150.h,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Center(
                child: Lottie.asset(
                  AppImages.loading,
                  fit: BoxFit.contain, // Shows the entire animation
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static Widget buildLoadingWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Center(
            child: Lottie.asset(
              AppImages.loading,
              fit: BoxFit.contain, // Ensures the full animation is visible
            ),
          ),
        ),
      ),
    );
  }
}
