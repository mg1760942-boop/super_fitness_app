import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/pages/smart_coach/get_started_view.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../generated/assets.dart';

class SmartCoachScreen extends StatelessWidget {
  SmartCoachScreen({super.key});

  final viewModel = getIt<SmartCoachScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BaseScaffold(
        backGroundPath: Assets.imagesBackgroundScafSec,
        body: BlocConsumer<SmartCoachScreenViewModel, SmartCoachScreenState>(
            builder: (context,state){
               return GetStartedView();
            }, listener: (context,state){}),
      ),
    );
  }
}
