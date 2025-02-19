import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/domain/entities/onboarding_entity.dart';

part 'onboarding_state.dart';

class OnboardingViewmodel extends Cubit<OnboardingState> {
  OnboardingViewmodel() : super(OnboardingInitial());
  int currentPage = 0;

  List<OnboardingEntity> onboardingList = [
    OnboardingEntity(
      title: "The Price Of Excellence Is Discipline",
      description:
          "Super Fitness is a fitness app that helps you to stay fit and healthy",
      image: AppImages.onboarding1,
    ),
    OnboardingEntity(
      title: "Fitness Has Never Been So Much Fun",
      description: "Track your progress and see how much you have improved",
      image: AppImages.onboarding2,
    ),
    OnboardingEntity(
      title: "NO MORE EXCUSES Do It Now",
      description:
          "Get started with Super Fitness and start your fitness journey",
      image: AppImages.onboarding3,
    ),
  ];

  void skip() {
    emit(OnboardingSkipState());
  }

  void changePage(int index) {
    currentPage = index;
    emit(OnboardingNextState()); // Emit state to notify listeners
  }
}
