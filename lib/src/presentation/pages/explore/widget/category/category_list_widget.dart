import 'package:super_fitness_app/src/presentation/pages/explore/widget/category/item_category_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_colors.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../../domain/entities/home/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF2D2D2D),
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemCategoryWidget(
                categoryModel: CategoryModel.categories[index], index: index);
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1.w,
              indent: 8.w,
              endIndent: 8.w,
              height: 8.h,
              color: const Color(0xFF2D2D2D),
            );
          },
          itemCount: CategoryModel.categories.length),
    );
  }
}
