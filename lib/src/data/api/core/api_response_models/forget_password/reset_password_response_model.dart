import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';

part 'reset_password_response_model.g.dart';

@JsonSerializable()
class ResetPasswordResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ResetPasswordResponseModel ({
    this.message,
    this.token,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseModelToJson(this);
  }

  ResetPasswordResponseEntity toDomain(){
    return ResetPasswordResponseEntity(
      message: message,
    );
  }
}


