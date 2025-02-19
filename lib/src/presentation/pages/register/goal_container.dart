import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/register/widgets/title_sub_widget.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../shared/radio_tile_item.dart';

class GoalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewmodel = context.watch<RegisterViewmodel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSubWidget(
            title: 'what is your goal ?',
            subtitle: 'this helps us create Your personalized plan'),
        const SizedBox(height: 16),
        BluredContainer(
          radius: BorderRadius.circular(50),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              ...viewmodel.goals.map(
                (goal) {
                  return RadioTileItem(
                    goal: goal,
                    selectedGoal: viewmodel.selectedGoal ?? '',
                    onSelected: () {
                      viewmodel.addGoal(goal);
                    },
                    onChanged: (value) {
                      viewmodel.addGoal(value);
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              CustomAuthButton(
                  text: 'Next',
                  onPressed: () {
                    if (viewmodel.selectedGoal != null) {
                      var nextPageIndex = viewmodel.currentPage + 1;
                      viewmodel.changePage(nextPageIndex);
                    }
                  },
                  color: Color(0xFFFF4100),
                  radius: 50),
            ],
          ),
        ),
      ],
    );
  }
}
