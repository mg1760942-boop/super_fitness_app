import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/register/widgets/title_sub_widget.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';

import '../../shared/radio_tile_item.dart';

class PhysicalActivityContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewmodel = context.watch<RegisterViewmodel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSubWidget(
          title: 'your regular physical ',
          subtitle: 'activity level ?',
          isPhysicalActivity: true,
        ),
        const SizedBox(height: 16),
        BluredContainer(
          radius: BorderRadius.circular(50),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              ...viewmodel.physicalActivity.map(
                (physicalActivity) {
                  return RadioTileItem(
                    goal: physicalActivity,
                    selectedGoal: viewmodel.selectedPhysicalActivity ?? '',
                    onSelected: () {
                      viewmodel.addPhysicalActivity(physicalActivity);
                    },
                    onChanged: (value) {
                      viewmodel.addPhysicalActivity(value);
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
