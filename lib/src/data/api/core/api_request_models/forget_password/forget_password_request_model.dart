import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';

part 'forget_password_request_model.g.dart';

@JsonSerializable()
class ForgetPasswordRequestModel {
  @JsonKey(name: "email")
  final String email;

  ForgetPasswordRequestModel ({
   required this.email,
  });

  factory ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordRequestModelToJson(this);
  }

  factory ForgetPasswordRequestModel.fromDomain(ForgetPasswordRequestEntity entity) {
    return ForgetPasswordRequestModel(
      email: entity.email,
    );
  }
}


