import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/dialogs/awesome_dialoge.dart';
import 'package:super_fitness_app/src/presentation/managers/profile/profile_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/profile/widgets/profile_content.dart';

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
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: ProfileContent(viewModel: viewModel),
            ),
          );
        },
      ),
    );
  }
}
