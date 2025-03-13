sealed class WorkoutsScreenActions{}
class GetMusclesGroupAction extends WorkoutsScreenActions{}
class ChangeSelectedTabAction extends WorkoutsScreenActions{
  int? selectedTab;
  ChangeSelectedTabAction({this.selectedTab});
}
class GetMusclesDataAction extends WorkoutsScreenActions{}