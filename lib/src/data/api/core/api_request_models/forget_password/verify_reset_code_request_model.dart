import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';

part 'verify_reset_code_request_model.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestModel {
  @JsonKey(name: "resetCode")
  final String resetCode;

  VerifyResetCodeRequestModel ({
    required this.resetCode,
  });

  factory VerifyResetCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestModelToJson(this);
  }
  factory VerifyResetCodeRequestModel.fromDomain(VerifyResetCodeRequestEntity entity) {
    return VerifyResetCodeRequestModel(
      resetCode: entity.resetCode,
    );
  }
}


