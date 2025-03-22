// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_group_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesGroupResponseModel _$MusclesGroupResponseModelFromJson(
        Map<String, dynamic> json) =>
    MusclesGroupResponseModel(
      message: json['message'] as String?,
      musclesGroup: (json['musclesGroup'] as List<dynamic>?)
          ?.map((e) => MusclesGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusclesGroupResponseModelToJson(
        MusclesGroupResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'musclesGroup': instance.musclesGroup,
    };

MusclesGroup _$MusclesGroupFromJson(Map<String, dynamic> json) => MusclesGroup(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MusclesGroupToJson(MusclesGroup instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
    };
