import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/presentation/pages/register/goal_container.dart';
import 'package:super_fitness_app/src/presentation/pages/register/physical_activity_container.dart';

part 'register_state.dart';

@injectable
class RegisterViewmodel extends Cubit<RegisterState> {
  RegisterViewmodel() : super(RegisterInitial());
  int currentPage = 0;
  final PageController pageController = PageController();

  List<Widget> registerObjects = [
    GoalContainer(),
    PhysicalActivityContainer(),
  ];
  final List<String> goals = [
    'Gain Weight',
    'Lose Weight',
    'Get Fitter',
    'Gain More Flexible',
    'Learn The Basic'
  ];
  final List<String> physicalActivity = [
    'Rookie',
    'Beginner',
    'Intermediate',
    'Advance',
    'True Beast'
  ];
  String? selectedGoal;
  String? selectedPhysicalActivity;
  void changePage(int index) {
    currentPage = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    emit(RegisterNextState()); // Emit state to notify listeners
  }

  void addGoal(String goal) {
    selectedGoal = goal;
    emit(AddGoalState());
  }

  void addPhysicalActivity(String activity) {
    selectedPhysicalActivity = activity;
    emit(AddPhysicalActivityState());
  }
}
