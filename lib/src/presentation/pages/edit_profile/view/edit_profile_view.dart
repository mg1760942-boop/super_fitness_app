import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_icons.dart';
import '../../../../../core/utilities/style/app_images.dart';
import '../../../../../core/utilities/style/app_text_styles.dart';
import '../../../shared/base_scaffold.dart';
import '../widget/edit_profile_app_bar_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseScaffold(
      backGroundPath: AppImages.baseBackGround,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 49.0.h,horizontal: 16.0.w),
        child: Column(
          children: [
            EditProfileAppBarWidget(),
          ],
        ),
      ),

    );
  }
}
