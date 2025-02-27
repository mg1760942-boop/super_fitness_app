
import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_colors.dart';
import '../../../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../../../core/utilities/style/spacing.dart';

class InfoSelectionEditProfileWidget extends StatelessWidget {
  final String title;
  final String titleForm;
  final void Function()? onTap;

  const InfoSelectionEditProfileWidget({super.key, required this.title, required this.titleForm, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title,style: AppTextStyles.font20w600White,),
            Text("\t (",style: AppTextStyles.font20w600White,),
            Text("\t tap To Edit \t ",style: AppTextStyles.font16Medium.copyWith(color: AppColors.mainColor),),
            Text(")",style: AppTextStyles.font20w600White,),
          ],
        ),
        verticalSpace(8),
        InkWell(
          onTap: onTap ,
          child: Container(
            height: 33.h,
            width: double.infinity,// Fixed height
            //margin: const EdgeInsets.only(bottom: 16),
            decoration: ShapeDecoration(
              color: const Color(0x33D3D3D3),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFD9D9D9),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 8),
              child: Text(titleForm ,style: TextStyle(fontSize: 12.sp,color: Color(0xFFD3D3D3)),),
            ),

          ),
        )
      ],
    );
  }
}
