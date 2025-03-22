import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_colors.dart';

class PopularButtonWidget extends StatelessWidget {
  final String title;
  final Color colorText;
  const PopularButtonWidget({super.key, required this.title, required this.colorText});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 65.w,
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:  Color(0xFF24242480).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text("24 Tasks",style:TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: colorText,
      ),),
    );
  }
}
