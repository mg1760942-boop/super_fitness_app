import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/auth/forget_password/reset_password_request_entity.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable()
class ResetPasswordRequestModel {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "newPassword")
  final String newPassword;

  ResetPasswordRequestModel ({
    required this.email,
    required this.newPassword,
  });

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordRequestModelToJson(this);
  }

  factory ResetPasswordRequestModel.fromDomain(ResetPasswordRequestEntity entity) {
    return ResetPasswordRequestModel(
      email: entity.email,
      newPassword: entity.newPassword,
    );
  }
}


