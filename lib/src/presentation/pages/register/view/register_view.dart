import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';
import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/dialogs/awesome_dialoge.dart';
import '../../../../../core/utilities/dialogs/loading_dialog.dart';
import '../../../../../core/utilities/style/app_icons.dart';
import '../../../../../core/utilities/style/app_images.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../../data/api/core/errors/error_handler.dart';
import '../../../shared/base_scaffold.dart';
import '../widgets/circular_indicator_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewmodel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BaseScaffold(
      backGroundPath: AppImages.backgroundScafSec,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _viewmodel,
          child: BlocListener<RegisterViewModel, RegisterState>(
            listener: (context, state) {
              switch (state) {
                case RegisterLoadingState():
                  LoadingDialog.show(context);
                case RegisterErrorState():
                  LoadingDialog.hide(context);
                  var errorMessage = ErrorHandler.fromException(
                          state.exception, context.localization)
                      .errorMessage;
                  showAwesomeDialog(context,
                      title: context.localization.error,
                      desc: errorMessage,
                      onOk: () {},
                      dialogType: DialogType.error);
                case RegisterSuccessState():
                  LoadingDialog.hide(context);
                  Navigator.pushNamed(context, PageRoutesName.onboarding);

                default:
              }
            },
            child: BlocBuilder<RegisterViewModel, RegisterState>(
              builder: (context, state) {
                // Determine if we need to show the back button.
                final showBackButton = _viewmodel.currentPage > 0;
                final total = _viewmodel.registerObjects.length;
                final current = _viewmodel.currentPage + 1; // 1-based display
                final progress =
                    _viewmodel.currentPage == 0 ? 0.0 : current / total;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: showBackButton
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF4100),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: SvgPicture.asset(
                                        AppIcons.backIcon,
                                        color: Colors.white,
                                        width: 10,
                                        height: 10,
                                      ),
                                      onPressed: () {
                                        _viewmodel.changePage(
                                            _viewmodel.currentPage - 1);
                                      },
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                AppImages.appLogo,
                                width: 70,
                                height: 48,
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    // Progress Indicator
                    showBackButton &&
                            _viewmodel.selectedGender !=
                                Gender.unSelectionGender
                        ? CircularIndicatorWidget(
                            progress: progress,
                            current: (current - 1),
                            total: (total - 1),
                          )
                        : SizedBox.shrink(),
                    verticalSpace(8),
                    // PageView
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _viewmodel.registerObjects.length,
                        controller: _viewmodel.pageController,
                        onPageChanged: (index) {
                          _viewmodel.changePage(index);
                        },
                        itemBuilder: (context, index) {
                          return _viewmodel.registerObjects[index];
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
