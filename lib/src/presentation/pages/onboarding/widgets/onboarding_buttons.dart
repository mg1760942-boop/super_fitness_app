import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dot_items.dart';

class NextBackButtuns extends StatelessWidget {
  const NextBackButtuns({
    Key? key,
    required this.finish,
    required this.pageController,
    required this.length,
    required this.changePage,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;
  final PageController pageController;
  final void Function(int) changePage;
  final int length;
  final void Function() finish;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            length,
            (index) => DotItems(isActive: index == currentPage),
          ),
        ),
        const SizedBox(height: 24.0),

        // Back/Next Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (currentPage > 0)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.r),
                  ),
                  side: BorderSide(
                    color: Color(0xFFFF6A00),
                  ),
                ),
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  changePage(currentPage - 1);
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            if (currentPage > 0) Spacer(),
            Expanded(
              flex: currentPage == 0 ? 1 : 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.r),
                  ),
                  backgroundColor: Color(0xFFFF6A00),
                ),
                onPressed: currentPage < length - 1
                    ? () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        changePage(currentPage + 1);
                      }
                    : finish,
                child: Text(
                  currentPage < length - 1 ? 'Next' : 'Do it',
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
