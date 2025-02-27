import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';

import '../../../../core/common/common_imports.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customAppBar(),

          ],
        ),
      ),
    );
  }

  Widget _customAppBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
        horizontalSpace(56),
        Column(
          children: [
            Text("Hi ahmed,",style: AppTextStyles.font16w500,),
            verticalSpace(4),
            Text("I Am Your Smart Coach",style: AppTextStyles.font18w700,),
          ],
        )
      ],
    );
  }
}
