import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  ForgetPasswordResponseModel ({
    this.message,
    this.info,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordResponseModelToJson(this);
  }

  ForgetPasswordResponseEntity toDomain(){
    return ForgetPasswordResponseEntity(
      message: message,
      info: info,
    );
  }
}


