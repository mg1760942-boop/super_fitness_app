import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
import 'package:super_fitness_app/src/presentation/managers/edit_profle/edit_profle_action.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/edit_profile_body_widget/edit_profile_body_widget.dart';
import 'package:super_fitness_app/src/presentation/pages/edit_profile/widget/user_goal_selection_widget/user_goal_selection_widget.dart';

import '../../../../core/common/common_imports.dart';
import '../../pages/edit_profile/widget/user_physical_activity_selection_widget/user_physical_activity_selection_widget.dart';
import '../../pages/edit_profile/widget/user_weight_selection_widget/user_weight_selection_widget.dart';

part 'edit_profile_state.dart';
@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

   /// Initial Data

  final List<String> goals = [
    'Gain Weight',
    'Lose Weight',
    'Get Fitter',
    'Gain More Flexible',
    'Learn The Basic'
  ];
  final Map<String,String> physicalActivity = {
    "level1":"Rookie",
    "level2":"Beginner",
    "level3":"Intermediate",
    "level4":"Advance",
    "level5":"True Beast",

  };
   String selectedPhysicalActivity = " ";
   List<Widget>editProfileBodyWidget=[
    EditProfileBodyWidget(),
     UserWeightSelectionWidget(),
    UserGoalSelectionWidget(),
    UserPhysicalActivitySelectionWidget(),

  ];
   PageController pageController = PageController();
   AppUserEntity appUserEntity= AppUserEntity(firstName: "", lastName: "", email: "",
       gender: "", height: 0.0,
       weight: 0.0, age: 0.0,
       goal: "", activityLevel: "",
       photo: "");
   String selectedGoal ="";
   bool isEnable=false;
   int selectWeight=0;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  var formKey=GlobalKey<FormState>();


/// Do Action
  Future<void>doAction(EditProfileAction action)async{
    switch (action) {
      case GoNextSectionAppScreenAction():
        return _goNextToSectionAppScreen();
      case ChangePageWeightAction():
        return _goNextPageWeightState();
      case ChangePageGoalAction():
        _goNextPageGoalState();
      case ChangeEnableAction():
        return _changeEnable(changeEnable: action.isEnable);
      case InitialAppUserEntityAction():
        return _initialAppUserEntity();
      case ChangeSelectedGoalAction():
        _changeSelectedGoal(action.goal);
      case ChangeSelectedPhysicalActivityAction():
        _changeSelectedPhysicalActivity(action.physicalActivity);
      case ChangeSelectedWeightAction():
       return _changeSelectedWeight(action.weight);
      case GoNextPagePhysicalActivityAction():
        return _goNextPagePhysicalActivityState();
      case GoNextPageEditProfileFormFieldAction():
        return _goNextPageEditProfileFormField();
      case GoNextPageGoalAction():
        return _goNextPageGoalState();
      case GoNextPageWeightAction():
        return _goNextPageWeightState();

    }
  }











 // Login App Edit Profile
     void _changeSelectedGoal(String goal) {
     if(selectedGoal!=goal){
       selectedGoal=goal;
       _changeEnable(changeEnable: true);
       emit(ChangeSelectedGoalState());
       return;
     }
   }
     void _changeSelectedPhysicalActivity(String physicalActivity) {
      if(selectedPhysicalActivity!=physicalActivity){
       selectedPhysicalActivity=physicalActivity;
       _changeEnable(changeEnable: true);
       emit(ChangeSelectedPhysicalActivityState());
       return;
     }

   }
     void _initialAppUserEntity(){
    selectedGoal = appUserEntity.goal.toString();selectedPhysicalActivity =
        selectedPhysicalActivity= appUserEntity.activityLevel.toString();
      selectWeight= appUserEntity.weight!.toInt();
     _initialPopularFields();

  }
     void  _changeEnable({required bool changeEnable}){
    if(isEnable  != changeEnable){
      isEnable=changeEnable;
      emit(ChangeEnableState());
    }
  }
     void _popularField(TextEditingController controller, String? value) {
    controller.text = controller.text.isEmpty ? value ?? "" : controller.text;
  }
     void _initialPopularFields() {
    _popularField(emailController, appUserEntity.email);
    _popularField(firstNameController, appUserEntity.firstName);
    _popularField(lastNameController, appUserEntity.lastName);
  }
     void _resetFormField() {
    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
  }
     void _changeSelectedWeight(int weight){
    if(selectWeight!=weight){
      selectWeight=weight;
      _changeEnable(changeEnable: true);
      emit(ChangeSelectedWeightState());
    }

     }



  //// Go Next Page App
  void _goNextToSectionAppScreen(){
    _resetFormField();
    emit(GoNextToSectionAppScreen());

  }
  void _goNextPageWeightState(){
    emit(GoNextPageWeightState());
  }
  void _goNextPageGoalState(){
    emit(GoNextPageGoalState());
  }
  void _goNextPagePhysicalActivityState(){
    emit(GoNextPagePhysicalActivityState());
  }
   void _goNextPageEditProfileFormField(){
    emit(GoNextPageEditProfileFormField());
   }


 /// Call Api
  Future<void>editProfile()async{
    if(formKey.currentState!.validate()){

    }else{

    }
  }















}
