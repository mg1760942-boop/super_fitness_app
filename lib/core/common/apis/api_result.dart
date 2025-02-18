import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

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