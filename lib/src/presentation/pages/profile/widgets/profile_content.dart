import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_icons.dart';
import '../../../../../core/utilities/style/app_text_styles.dart';
import '../../../../../core/utilities/style/images/cached_network_image _widget.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../managers/localization/localization_viewmodel.dart';
import '../../../managers/profile/profile_viewmodel.dart';
import '../../../shared/blured_container.dart';
import 'action_profile_row.dart';
import 'language_row.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileViewmodel>();
    bool isLoading = viewModel.appUserEntity == null;

    return Center(
      child: Column(
        children: [
          Text(
            context.localization.profile,
            style: AppTextStyles.font24w600White,
          ),
          verticalSpace(40),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[400],
                    ),
                  ),
                )
              : CachedNetworkImageWidget(
                  imageUrl: viewModel.appUserEntity?.photo ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
          verticalSpace(8),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: 120,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[400],
                    ),
                  ),
                )
              : Text(
                  '${viewModel.appUserEntity?.firstName ?? ''} ${viewModel.appUserEntity?.lastName ?? ''}',
                  style: AppTextStyles.font20w600White,
                ),
          verticalSpace(48),
          BluredContainer(
            radius: BorderRadius.circular(20),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ActionProfileRow(
                  title: context.localization.editProfile,
                  icon: AppIcons.editProfileIcon,
                  onTap: ()=>_goNextToEditProfile(viewModel),
                ),
                verticalSpace(16),
                ActionProfileRow(
                  title: context.localization.changePassword,
                  icon: AppIcons.changePasswordIcon,
                  onTap: () {},
                ),
                verticalSpace(16),
                LanguageRow(
                    onTap: () {},
                    isEnabled: BlocProvider.of<LocalizationViewmodel>(context)
                        .isEnglishLanguage(),
                    onSelected: (value) {
                      viewModel.switchLanguage(value);
                      if (value) {
                        BlocProvider.of<LocalizationViewmodel>(context)
                            .cachingLanguageCode(languageCode: "en");
                      } else {
                        BlocProvider.of<LocalizationViewmodel>(context)
                            .cachingLanguageCode(languageCode: "ar");
                      }
                    }),
                verticalSpace(16),
                ActionProfileRow(
                  title: context.localization.security,
                  icon: AppIcons.securityIcon,
                  onTap: () {
                    navKey.currentState!
                        .pushNamed(PageRoutesName.securityScreen);
                  },
                ),
                verticalSpace(16),
                ActionProfileRow(
                  title: context.localization.privacy,
                  icon: AppIcons.privacyIcon,
                  onTap: () {
                    navKey.currentState!
                        .pushNamed(PageRoutesName.privacyScreen);
                  },
                ),
                verticalSpace(16),
                ActionProfileRow(
                  title: context.localization.help,
                  icon: AppIcons.helpIcon,
                  onTap: () {
                    navKey.currentState!.pushNamed(PageRoutesName.helpScreen);
                  },
                ),
                verticalSpace(16),
                ActionProfileRow(
                  title: context.localization.logout,
                  icon: AppIcons.logoutIcon,
                  onTap: () {
                    viewModel.needToLogout();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goNextToEditProfile(ProfileViewmodel viewModel) {
    navKey.currentState!.pushNamedAndRemoveUntil(PageRoutesName.editProfile,
    arguments: viewModel.appUserEntity,(route) => false,
    );
  }
}
