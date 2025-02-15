import 'package:json_annotation/json_annotation.dart';

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
}


