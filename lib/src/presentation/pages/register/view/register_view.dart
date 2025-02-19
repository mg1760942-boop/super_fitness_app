import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:super_fitness_app/core/utilities/style/app_fonts.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/app_images.dart';
import '../../../shared/base_scaffold.dart';
import '../../../shared/blured_container.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final ItemScrollController _scrollController = ItemScrollController();
  int _selectedIndex = 3; // 25 is the default selected index
  final List<int> years = List.generate(10, (index) => 22 + index);

  void _scrollToIndex(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffold(
        backGroundPath: AppImages.backgroundScafSec,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 46.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SizedBox(
                      width: 70,
                      height: 48,
                      child: Image.asset(AppImages.appLogo)),
                ),
                verticalSpace(100),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "HOW OLD ARE YOU?",
                        style: AppFonts.font20KWightWeightW800Font,
                      ),
                      verticalSpace(16),
                      Text(
                        "this helps us create Your personalized plan",
                        style: AppFonts.font16KWightWeightW400Font,
                      ),
                    ],
                  ),
                ),
                BluredContainer(
                  radius: BorderRadius.all(Radius.circular(50)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    children: [
                      verticalSpace(8),
                      Text(
                        "Year ",
                        style: AppFonts.font12MainWeight400
                            .copyWith(color: AppColors.primary),
                      ),
                      verticalSpace(7),
                      SizedBox(
                        height: 50.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() => _selectedIndex = index);
                                _scrollToIndex(index);
                              },
                              child: SizedBox(
                                width: 50.w,
                                height:
                                    62.h, // Ensure uniform width for all items
                                child: Center(
                                  child: Text(
                                    index.toString(),
                                    style: TextStyle(
                                      color: index == _selectedIndex
                                          ? Colors.orange
                                          : Colors.white,
                                      fontSize: index == _selectedIndex
                                          ? 44.sp
                                          : 32.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 4.w),
                          itemCount: 100,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        color: AppColors.primary,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
