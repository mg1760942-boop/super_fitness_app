import 'dart:io';

import 'package:super_fitness_app/src/data/api/core/api_request_models/edit_profile_request/edit_profile_request.dart';

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


class EditProfileButtonAction extends EditProfileAction{
}

class UpdateProfileButtonAction extends EditProfileAction{
  final File image;
  UpdateProfileButtonAction({required this.image});
}