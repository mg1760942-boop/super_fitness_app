import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_actions.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_states.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_view_model.dart';
import 'package:super_fitness_app/src/presentation/pages/workouts/workouts_screen_body.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';

class WorkoutsScreen extends StatelessWidget {
  WorkoutsScreen({super.key});

  final viewModel = getIt.get<WorkoutsScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_){
        viewModel.doAction(GetMusclesGroupAction());
        return viewModel;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Workouts",style: AppTextStyles.font24w600White,),
        ),
        body: BlocConsumer<WorkoutsScreenViewModel, WorkoutsScreenStates>(
            builder: (context, state) {
              if(state is WorkoutsScreenLoadingState){
                return Center(child: CircularProgressIndicator(),);
              }
              return WorkoutsScreenBody();
            }, listener: (context, state) {}),
      ),
    );
  }
}
