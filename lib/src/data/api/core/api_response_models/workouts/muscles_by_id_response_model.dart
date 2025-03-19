import 'package:json_annotation/json_annotation.dart';

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
}


