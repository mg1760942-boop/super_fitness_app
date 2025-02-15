import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';

part 'verify_reset_code_response_model.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseModel {
  @JsonKey(name: "status")
  final String? status;

  VerifyResetCodeResponseModel ({
    this.status,
  });

  factory VerifyResetCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeResponseModelToJson(this);
  }
  VerifyResetCodeResponseEntity toDomain() {
    return VerifyResetCodeResponseEntity(
      status: status,
    );
  }
}


