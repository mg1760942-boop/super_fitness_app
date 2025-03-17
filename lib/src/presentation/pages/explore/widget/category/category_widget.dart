import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import 'category_list_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Categories",style:AppFonts.font16KWightWeightW600Font,),
        verticalSpace(8),
        CategoryListWidget(),
      ],
    );
  }
}
