import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/register/register_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/register/register_response_model.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
import 'package:super_fitness_app/src/presentation/pages/register/goal_container.dart';
import 'package:super_fitness_app/src/presentation/pages/register/physical_activity_container.dart';

import '../../../domain/usecases/auth/register/register_use_case.dart';
import '../../pages/register/widget/gender_selection_widget/gender_selection_body_widget.dart';
import '../../pages/register/widget/height_selection_widget/height_selection_widget.dart';
import '../../pages/register/widget/register_form_field_widget/register_body_form_widget.dart';
import '../../pages/register/widget/wight_selection_screen/wight_selection_widget.dart';
import '../../pages/register/widget/year_selection_widget/year_selection_widget.dart';

part 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
   final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase) : super(RegisterInitial());
  int currentPage = 0;
  final PageController pageController = PageController();

  List<Widget> registerObjects = [
    RegisterBodyFormWidget(),
    GenderSelectionBodyWidget(),
    YearSelectionWidget(),
    WightSelectionWidget(),
    HeightSelectionWidget(),
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
    int index=physicalActivity.indexWhere((element) => element==activity,);
    selectedPhysicalActivity = activity;
    selectedActivity="level${index+1}";
    emit(AddPhysicalActivityState());
  }

  bool isShowBackScreenIcon= false;
  String ? selectedActivity;

  //// Register Form
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool isCheckValidateRegisterForm(){
    if(formKey.currentState!.validate()){
      return true;
    }
    return false;
  }
  bool isShowConfirmPassword=true;
  void changePasswordVisible(){
    isShowConfirmPassword = ! isShowConfirmPassword;
    emit(ChangePasswordVisibleState());
  }

  ////GenderMaleFemale
  Gender selectedGender = Gender.unSelectionGender;
  void changeGender(Gender gender) {
    selectedGender = gender;
    emit(ChangeGenderState());
  }

 /// Navigate
  void goToNextGenderScreen(){
      var nextPageIndex = currentPage + 1;
      changePage(nextPageIndex);

  }
  int selectedYear =50;
  int selectedHeight=150;
  int selectedWeight=90;
  void goToOldAraYouScreenNext() {
    if (selectedGender != Gender.unSelectionGender) {
    var nextPageIndex = currentPage + 1;
    changePage(nextPageIndex);
  }

  }
  void goToOWeightScreenNext() {
    if (selectedGender != Gender.unSelectionGender) {
      var nextPageIndex = currentPage + 1;
      changePage(nextPageIndex);
    }
    emit(NavigateToOldAraYouScreenNext());
  }
  void goToHeightScreenNext() {
    var nextPageIndex = currentPage + 1;
    changePage(nextPageIndex);
  }

  void goToGoalScreenNext() {
    var nextPageIndex = currentPage + 1;
    changePage(nextPageIndex);
  }
  void goToPhysicalActivityScreenNext() {
    var nextPageIndex = currentPage + 1;
    changePage(nextPageIndex);
  }
  void goToFinishScreenNext() {
    var nextPageIndex = currentPage + 1;
    changePage(nextPageIndex);
  }


  
  Future<void>register()async{
    emit(RegisterLoadingState());
    RegisterRequestModel registerRequestModel= RegisterRequestModel(
          email: emailController.text,
        height: selectedHeight,
          age: selectedYear,
          activityLevel: selectedActivity,
          goal: selectedGoal,
          weight: selectedWeight,
          firstName:firstNameController.text,
          gender: selectedGender.name,
          lastName: lastNameController.text,
          password: passwordController.text,
          rePassword: passwordController.text,
        );
   var result= await _registerUseCase.register(registerRequest: registerRequestModel);
   switch (result) {
     case Success<AppUserEntity>():
       emit(RegisterSuccessState());
     case Failures<AppUserEntity>():
       emit(RegisterErrorState(result.exception));
   }
  }
  
}
enum Gender{
  unSelectionGender,
  male,
  female
}
