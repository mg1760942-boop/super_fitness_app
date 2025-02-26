

import '../../../../../core/common/common_imports.dart';

import '../../../../../core/utilities/style/app_images.dart';

import '../../../shared/base_scaffold.dart';

import '../widget/edit_profile_body_widget/edit_profile_body_widget.dart';


class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BaseScaffold(
        backGroundPath: AppImages.baseBackGround,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0.h,horizontal: 16.0.w),
            child: Column(
              children: [

              ],
            )
          ),
        ),
      
      ),
    );
  }
}
