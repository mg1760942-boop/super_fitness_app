import 'package:super_fitness_app/src/presentation/pages/explore/widget/popular/popular_list_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("popular Training",style: AppFonts.font16KWightWeightW60Font,),
        verticalSpace(8),
        PopularListWidget(),
      ],
    );
  }
}
