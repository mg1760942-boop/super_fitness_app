import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscles_group_entity.dart';

part 'muscles_by_id_response_model.g.dart';

@JsonSerializable()
class MusclesByIdResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "muscleGroup")
  final MuscleGroup? muscleGroup;
  @JsonKey(name: "muscles")
  final List<Muscles>? muscles;

  MusclesByIdResponseModel ({
    this.message,
    this.muscleGroup,
    this.muscles,
  });

  factory MusclesByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MusclesByIdResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesByIdResponseModelToJson(this);
  }
  List<MusclesEntity> toDomain() {
    return muscles?.map((e) => e.toDomain()).toList() ?? [];
  }
}

@JsonSerializable()
class MuscleGroup {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;

  MuscleGroup ({
    this.Id,
    this.name,
  });

  factory MuscleGroup.fromJson(Map<String, dynamic> json) {
    return _$MuscleGroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MuscleGroupToJson(this);
  }
  MusclesGroupEntity toDomain(){
    return MusclesGroupEntity(
      id: Id,
      name: name
    );
  }
}

@JsonSerializable()
class Muscles {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;

  Muscles ({
    this.Id,
    this.name,
    this.image,
  });

  factory Muscles.fromJson(Map<String, dynamic> json) {
    return _$MusclesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesToJson(this);
  }

  MusclesEntity toDomain(){
    return MusclesEntity(
      id: Id,
      name: name,
      image: image
    );
  }
}


