import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_states.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';
import '../../managers/exercise/exercise_screen_view_model.dart';
import 'exercise_screen_body.dart';

class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({super.key});

  final viewModel = getIt<ExerciseScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<ExerciseScreenViewModel, ExerciseScreenStates>(
        builder: (context, state) {
          return Scaffold(
            body: ExerciseScreenBody(),
          );
        },
        listener: (context, state) {
          _handelListenerState(context,state);
        },
      ),
    );
  }

  _handelListenerState(context,state){
    if(state is NavigateToBackState){
      Navigator.of(context).pop();
    }
  }
}
