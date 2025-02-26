sealed class EditProfileAction{}

class GoNextSectionAppScreenAction extends EditProfileAction{}

class ChangePageWeightAction extends EditProfileAction{
}
class ChangePageGoalAction extends EditProfileAction{}
class ChangeEnableAction extends EditProfileAction{
  final bool isEnable;
  ChangeEnableAction({required this.isEnable});
}
class InitialAppUserEntityAction extends EditProfileAction{}
class ChangeSelectedGoalAction extends EditProfileAction{
  final String goal;
  ChangeSelectedGoalAction({required this.goal});
}
class ChangeSelectedPhysicalActivityAction extends EditProfileAction{
  final String physicalActivity;
  ChangeSelectedPhysicalActivityAction({required this.physicalActivity});
}
class ChangeSelectedWeightAction extends EditProfileAction{
  final int weight;
  ChangeSelectedWeightAction({required this.weight});

}




class GoNextPagePhysicalActivityAction extends EditProfileAction{}
class GoNextPageEditProfileFormFieldAction extends EditProfileAction{}
class GoNextPageGoalAction extends EditProfileAction{}
class GoNextPageWeightAction extends EditProfileAction{}