import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../../../core/utilities/style/spacing.dart';
import 'edit_profile_image_widget.dart';

class UserProfileSectionWidget extends StatelessWidget {
  const UserProfileSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: EditProfileImageWidget()),
        verticalSpace(8),
        Center(child: Text("Ahmed Mohamed",style: AppTextStyles.font20w600White,)),
      ],
    );
  }
}
