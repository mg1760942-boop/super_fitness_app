import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/dialogs/awesome_dialoge.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/core/utilities/style/spacing.dart';
import 'package:super_fitness_app/src/presentation/managers/profile/profile_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/profile/widgets/profile_content.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';
import '../../../data/api/core/errors/error_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    profileViewModel.getUserData();
    super.initState();
  }

  var profileViewModel = getIt.get<ProfileViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileViewmodel>();
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) => Center(
        child: SpinKitCubeGrid(color: AppColors.mainColor),
      ),
      child: BlocConsumer<ProfileViewmodel, ProfileState>(
        listener: (context, state) {
          context.loaderOverlay.hide();
          if (state is ProfileLoading) {
            context.loaderOverlay.show();
          } else if (state is ProfileError) {
            var error = ErrorHandler.fromException(
                state.exception, context.localization);
            showAwesomeDialog(
              context,
              title: context.localization.error,
              desc: error.errorMessage,
              onOk: () {},
              dialogType: DialogType.error,
            );
          } else if (state is ShowLogoutDialogState) {
            _logout_dialog(context, viewModel);
          }
          else if(state is LogoutSuccessState){
            Navigator.pushNamedAndRemoveUntil(context, PageRoutesName.login, (route) => false);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: ProfileContent(),
          );
        },
      ),
    );
  }

  void _logout_dialog(BuildContext context, ProfileViewmodel viewModel) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.grey[900]!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: 300.w,
          height: 180.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Are You Sure To Close The Application?", style: AppTextStyles.font20w600White,textAlign: TextAlign.center,),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(
                     child: CustomAuthButton(text: "NO",textStyle: AppTextStyles.font14w800, onPressed: (){
                       Navigator.pop(context);
                     }, color: AppColors.kBlackBase, radius: 200,borderColor: AppColors.mainColor,),
                   ),
                  horizontalSpace(20),
                  Expanded(
                    child: CustomAuthButton(text: "YES",textStyle: AppTextStyles.font14w800, onPressed: (){
                       viewModel.logout();
                    }, color: AppColors.mainColor, radius: 200),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
