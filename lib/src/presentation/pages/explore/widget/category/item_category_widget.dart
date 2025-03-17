import 'package:super_fitness_app/src/domain/entities/home/category_model.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_colors.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class ItemCategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  const ItemCategoryWidget({super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/gym.png"
          ,width: 56.w,height: 56.h,fit: BoxFit.cover,),
        verticalSpace(8),
        Text(CategoryModel.categories[index].name,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.kWhiteBase,
          ),),
      ],
    );
  }
}
