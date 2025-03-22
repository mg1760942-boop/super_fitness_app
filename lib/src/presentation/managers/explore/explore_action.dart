sealed class ExploreAction {}
 class GetProfileAction extends  ExploreAction {}
class GetRandomMusclesAction extends  ExploreAction {}
class GetUpcomingWorkTapAction extends  ExploreAction {}
class ChangeCurrentCategoryAction extends  ExploreAction {
  final String category;
  ChangeCurrentCategoryAction(this.category);

}