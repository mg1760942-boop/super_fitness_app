sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

class ExploreGetProfileLoadingState extends ExploreState {}
class ExploreGetProfileSuccessState extends ExploreState {}

class ExploreGetMusclesRandomLoadingState extends ExploreState {}
class ExploreGetMusclesRandomSuccessState extends ExploreState {}


class ExploreGetUpcomingWorkTapLoadingState extends ExploreState {}
class ExploreGetUpcomingWorkTapSuccessState extends ExploreState {}


class ChangeCurrentCategoryState extends ExploreState {}

class ExploreGetUpcomingWorkBodyTapLoadingState extends ExploreState {}
class ExploreGetUpcomingWorkBodyTapSuccessState extends ExploreState {}


class ExploreErrorState extends ExploreState {
  final Exception exception;
  ExploreErrorState(this.exception);

}