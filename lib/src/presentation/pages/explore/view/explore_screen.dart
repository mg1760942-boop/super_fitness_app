import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/managers/explore/explore_action.dart';
import 'package:super_fitness_app/src/presentation/managers/explore/explore_cubit.dart';
import 'package:super_fitness_app/src/presentation/managers/explore/explore_state.dart';
import '../../../../../core/common/common_imports.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utilities/dialogs/awesome_dialoge.dart';
import '../../../../data/api/core/errors/error_handler.dart';
import '../widget/explore_body_widget.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  var exploreViewModel = getIt.get<ExploreCubit>();


   @override
  void initState() {
     Future.wait([
     exploreViewModel.doAction(GetProfileAction()),
     exploreViewModel.doAction(GetRandomMusclesAction()),
     exploreViewModel.doAction(GetUpcomingWorkTapAction()),
     ]);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => exploreViewModel,
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) => _handleBlocBuilderState(state),

      ),
    );
  }

  Widget _handleBlocBuilderState(ExploreState state){
    {
      if(state is ExploreGetProfileLoadingState ||
          state is ExploreGetMusclesRandomLoadingState ){
        return const Center(child: CircularProgressIndicator());
      }
      else if (state is ExploreErrorState) {
        var error = ErrorHandler.fromException(
            state.exception, context.localization);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showAwesomeDialog(
            context,
            title: context.localization.error,
            desc: error.errorMessage,
            onOk: () {},
            dialogType: DialogType.error,
          );
        });
        return SizedBox.shrink();
      }
      else{
        return ExploreBodyWidget();
      }

  }
}
  }