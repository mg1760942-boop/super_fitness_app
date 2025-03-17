import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/dialogs/awesome_dialoge.dart';
import '../../../../../core/utilities/dialogs/loading_dialog.dart';
import '../../../../../core/utilities/dialogs/toast_dialoge.dart';
import '../../../../../core/utilities/style/app_images.dart';
import '../../../../data/api/core/errors/error_handler.dart';
import '../../../../domain/entities/app_user_entity/app_user_entity.dart';
import '../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../managers/edit_profle/edit_profle_action.dart';
import '../../../shared/base_scaffold.dart';
import '../widget/edit_profile_page_view_widget.dart';
class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  var editProfileViewModel = getIt.get<EditProfileCubit>();

  @override
  void dispose() {
    editProfileViewModel.emailController.dispose();
    editProfileViewModel.firstNameController.dispose();
    editProfileViewModel.lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    editProfileViewModel.appUserEntity =
        ModalRoute.of(context)!.settings.arguments as AppUserEntity;
    editProfileViewModel.doAction(InitialAppUserEntityAction());

    return BlocProvider(
      create: (context) => editProfileViewModel,
      child: SafeArea(
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) => _handleBlocListenerWidget(state),
          builder: (context, state) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (result, dats) {
                _goNextToSectionAppScreen(context);
              },
              child: BaseScaffold(
                backGroundPath: AppImages.baseBackGround,
                body: EditProfilePageViewWidget(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleBlocListenerWidget(EditProfileState state) {
    if (state is GoNextToSectionAppScreen) {
      _goNextToSectionAppScreen(context);
    } else if (state is GoNextPageWeightState) {
      _goNextPageController(context, 1);
    } else if (state is GoNextPageGoalState) {
      _goNextPageController(context, 2);
    } else if (state is GoNextPagePhysicalActivityState) {
      _goNextPageController(context, 3);
    } else if (state is GoNextPageEditProfileFormField) {
      _goNextPageController(context, 0);
    } else if (state is EditProfileLoadingState) {
      LoadingDialog.show(context);
    } else if (state is EditProfileSuccessState) {
      LoadingDialog.hide(context);







      showAwesomeDialog(
        context,
        title: "Success",
        desc: "Profile Updated",
        dialogType: DialogType.success,
        onOk: () {
          editProfileViewModel.doAction(GoNextSectionAppScreenAction());
        },
      );
    } else if (state is EditProfileErrorState) {
      LoadingDialog.hide(context);
      var errorMessage =
          ErrorHandler.fromException(state.exception, context.localization)
              .errorMessage;
      showAwesomeDialog(context,
          title: context.localization.error,
          desc: errorMessage,
          onOk: () {},
          dialogType: DialogType.error);
    }
      else if (state is UpdateProfileLoading) {
      LoadingDialog.show(context);
    } else if (state is UpdateProfileError) {
      LoadingDialog.hide(context);
      var errorMessage =
          ErrorHandler.fromException(state.exception, context.localization)
              .errorMessage;
      ToastDialog.show(errorMessage);
    }
      else if (state is UpdateProfileSuccess) {
      LoadingDialog.hide(context);
      ToastDialog.show("Profile Image Updated", Colors.green);
    }

  }

  void _goNextToSectionAppScreen(BuildContext context) async{
    Navigator.pop(context,true);
  }

  void _goNextPageController(BuildContext context, int index) {
    editProfileViewModel.pageController.jumpToPage(index);
  }
}
