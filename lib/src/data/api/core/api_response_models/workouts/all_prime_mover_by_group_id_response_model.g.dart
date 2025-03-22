// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_prime_mover_by_group_id_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllPrimeMoverByGroupIdResposneModel
    _$AllPrimeMoverByGroupIdResposneModelFromJson(Map<String, dynamic> json) =>
        AllPrimeMoverByGroupIdResposneModel(
          message: json['message'] as String?,
          totalMuscles: (json['totalMuscles'] as num?)?.toInt(),
          muscles: (json['muscles'] as List<dynamic>?)
              ?.map((e) => Muscles.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$AllPrimeMoverByGroupIdResposneModelToJson(
        AllPrimeMoverByGroupIdResposneModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'totalMuscles': instance.totalMuscles,
      'muscles': instance.muscles,
    };

Muscles _$MusclesFromJson(Map<String, dynamic> json) => Muscles(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MusclesToJson(Muscles instance) => <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'image': instance.image,
    };
