import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import 'category_list_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.localizations.categories,style:AppFonts.font16KWightWeightW600Font,),
          verticalSpace(7),
          CategoryListWidget(),
        ],
      ),
    );
  }
}
