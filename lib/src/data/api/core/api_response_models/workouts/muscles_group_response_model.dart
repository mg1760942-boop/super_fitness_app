import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';

part 'muscles_group_response_model.g.dart';

@JsonSerializable()
class MusclesGroupResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "musclesGroup")
  final List<MusclesGroup>? musclesGroup;

  MusclesGroupResponseModel ({
    this.message,
    this.musclesGroup,
  });

  factory MusclesGroupResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MusclesGroupResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesGroupResponseModelToJson(this);
  }
  List<MusclesGroupEntity> toDomain(){
    return musclesGroup!.map((e)=>e.toDomain()).toList();
  }
}

@JsonSerializable()
class MusclesGroup {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;

  MusclesGroup ({
    this.Id,
    this.name,
  });

  factory MusclesGroup.fromJson(Map<String, dynamic> json) {
    return _$MusclesGroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesGroupToJson(this);
  }
  MusclesGroupEntity toDomain() {
    return MusclesGroupEntity(
      id: Id,
      name: name,
    );
  }
}


