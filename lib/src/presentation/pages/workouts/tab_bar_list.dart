import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_states.dart';
import 'package:super_fitness_app/src/presentation/pages/workouts/tab_bar_item.dart';

import '../../../../core/common/common_imports.dart';
import '../../managers/workouts/workouts_screen_view_model.dart';

class TabBarList extends StatefulWidget {
  const TabBarList({super.key});

  @override
  State<TabBarList> createState() => _TabBarListState();
}

ScrollController _controller = ScrollController();

void startScrollToIndex(int index) {
  _controller.animateTo(index * 60.0,
      duration: Duration(milliseconds: 500), curve: Curves.ease);
}

class _TabBarListState extends State<TabBarList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startScrollToIndex(context.read<WorkoutsScreenViewModel>().selectedTab);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WorkoutsScreenViewModel>();

    return BlocListener<WorkoutsScreenViewModel, WorkoutsScreenStates>(
      listener: (context, state) {
        if (state is SelectedTabChangedState) {
          setState(() {
            startScrollToIndex(viewModel.selectedTab);
          });
        }
      },
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
          controller: _controller,
          itemCount: viewModel.musclesGroup.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TabBarItem(
              muscle: viewModel.musclesGroup[index].name ?? "",
              index: index,
            );
          },
        ),
      ),
    );
  }
}
