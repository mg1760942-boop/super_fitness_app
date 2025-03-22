import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_exercises_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/all_prime_mover_by_group_id_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/muscles_by_id_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/muscles_group_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/workouts/random_muscles_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/logout/logout_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/meals_by_category_response.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/meals/meals_detail_response.dart';

import 'core/api_request_models/edit_profile_request/edit_profile_request.dart';
import 'core/api_request_models/forget_password/forget_password_request_model.dart';
import 'core/api_request_models/forget_password/reset_password_request_model.dart';
import 'core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import 'core/api_request_models/login/login_request.dart';
import 'core/api_request_models/register/register_request_model.dart';
import 'core/api_response_models/explore/recommendation_response_model/recommendation_response_model.dart';
import 'core/api_response_models/forget_password/forget_password_response_model.dart';
import 'core/api_response_models/forget_password/reset_password_response_model.dart';
import 'core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import 'core/api_response_models/login/login_response.dart';
import 'core/api_response_models/meals/categories_response.dart';
import 'core/api_response_models/register/register_response_model.dart';
import 'core/constants/api_base_url.dart';
import 'core/constants/api_end_points.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiEndPoints.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(
      @Body() ForgetPasswordRequestModel forgetPasswordRequestModel);

  @POST(ApiEndPoints.verifyReset)
  Future<VerifyResetCodeResponseModel> verifyResetCode(
      @Body() VerifyResetCodeRequestModel verifyResetCodeRequestModel);

  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
      @Body() ResetPasswordRequestModel resetPasswordRequestModel);

  @POST(ApiEndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiEndPoints.register)
  Future<RegisterResponseModel> register(
      {@Body() required RegisterRequestModel registerRequestModel});

  @GET(ApiEndPoints.getUserData)
  Future<LoginResponse> getUserData();

  @PUT(ApiEndPoints.editProfile)
  Future<RegisterResponseModel> editProfile(
      {@Body() required EditProfileRequest editProfileRequestModel});


  @GET(ApiEndPoints.muscles)
  Future<MusclesGroupResponseModel> getMusclesGroup();

  @GET(ApiEndPoints.exercises)
  Future<AllExercisesResponseModel> getAllExercises();

  @GET(ApiEndPoints.randomMuscles)
  Future<RandomMusclesResponseModel> getRandomMuscles();

  @GET("${ApiEndPoints.musclesGroup}/{id}")
  Future<MusclesByIdResponseModel> getMusclesByGroupId(@Path("id") String id);


  @GET("${ApiEndPoints.musclesGroup}/${ApiEndPoints.byMuscleGroup}")
  Future<AllPrimeMoverByGroupIdResposneModel> getAllPrimeMoverByGroupId(@Query("muscleGroupId") String muscleGroupId);


  @GET(ApiEndPoints.musclesRandom)
  Future<RecommendationResponseModel> getMusclesRandom();



  @GET(ApiEndPoints.logout)
  Future<LogoutResponseModel> logout();

}
