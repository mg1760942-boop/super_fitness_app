// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_requeset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequesetModel _$ResetPasswordRequesetModelFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequesetModel(
      email: json['email'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequesetModelToJson(
        ResetPasswordRequesetModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
    };
