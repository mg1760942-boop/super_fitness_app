import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/di/di.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/smart_coach/smart_coach_screen_view_model.dart';

import '../../../../core/common/common_imports.dart';

class SmartCoachScreen extends StatelessWidget {
   SmartCoachScreen({super.key});

  final viewModel = getIt<SmartCoachScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<SmartCoachScreenViewModel, SmartCoachScreenState>(
        builder: (context, state) {
          return SizedBox();
        },
        listener: (context, state) {},
      ),
    );
  }
}
