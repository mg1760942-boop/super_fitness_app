import 'package:json_annotation/json_annotation.dart';

part 'reset_password_requeset_model.g.dart';

@JsonSerializable()
class ResetPasswordRequesetModel {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "newPassword")
  final String newPassword;

  ResetPasswordRequesetModel ({
    required this.email,
    required this.newPassword,
  });

  factory ResetPasswordRequesetModel.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequesetModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordRequesetModelToJson(this);
  }
}


