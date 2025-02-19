import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';

sealed class ApiResult<T>{

}

class Success<T> extends ApiResult<T>{
  T? data;
  Success({this.data});
}

class Failures<T> extends ApiResult<T>{
  Exception exception;
  Failures({required this.exception});
}