import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/presentation/managers/section/section_screen_states.dart';
import 'package:super_fitness_app/src/presentation/pages/explore/explore_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/profile/profile_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/smart_coach/smart_coach_screen.dart';
import 'package:super_fitness_app/src/presentation/pages/workouts/workouts_screen.dart';

@injectable
class SectionScreenViewmodel extends Cubit<SectionScreenState> {
  SectionScreenViewmodel() : super(HomeInitial());

  int _currentIndex = 0;

  // Expose current index
  int get currentIndex => _currentIndex;

  final List<String> _titles = [
    'Home',
    'Categories',
    'Cart',
    'Profile',
  ];

  final List<Widget> _screens = [
    ExploreScreen(),
    SmartCoachScreen(),
    WorkoutsScreen(),
    ProfileScreen()
  ];

  String get currentTitle => _titles[_currentIndex];
  Widget get currentScreen => _screens[_currentIndex];

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeStateUpdated());
  }

  bool _showBottomNav = true; // controls visibility

  get showBottomNav => _showBottomNav;

  bool onScroll(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      if (notification.direction == ScrollDirection.reverse && _showBottomNav) {
        _showBottomNav = false;
        emit(HomeStateUpdated());
      } else if (notification.direction == ScrollDirection.forward &&
          !_showBottomNav) {
        _showBottomNav = true;
        emit(HomeStateUpdated());
      }
    }
    return false;
  }
}
