import 'package:super_fitness_app/src/presentation/pages/explore/widget/category/item_category_widget.dart';
import '../../../../../../core/common/common_imports.dart';
import '../../../../../domain/entities/home/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: ShapeDecoration(
        color: Color(0xCC242424),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 5,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
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
            return    Container(
            padding:  EdgeInsets.symmetric(horizontal: 1.w),
            decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF2C2C2C)),
            ),
              ));
          },
          itemCount: CategoryModel.categories.length),
    );
  }
}
