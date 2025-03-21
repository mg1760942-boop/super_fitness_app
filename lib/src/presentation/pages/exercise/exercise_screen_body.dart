import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/exercise/exercise_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/difficulty_selection.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/exercise_details.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/exercise_list.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/header_section.dart';

import '../../../../core/common/common_imports.dart';

class ExerciseScreenBody extends StatelessWidget {
  const ExerciseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ExerciseScreenViewModel>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          ExerciseDetails(),
          DifficultySelection(),
          ExerciseList()
        ],
      ),
    );
  }
}
