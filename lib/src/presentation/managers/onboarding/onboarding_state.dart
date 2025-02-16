part of 'onboarding_viewmodel.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingNextState extends OnboardingState {}

final class OnboardingSkipState extends OnboardingState {}
