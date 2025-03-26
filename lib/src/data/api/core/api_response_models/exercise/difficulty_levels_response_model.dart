import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/exercise/difficulty_level_entity.dart';

part 'difficulty_levels_response_model.g.dart';

@JsonSerializable()
class DifficultyLevelsReponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "levels")
  final List<Levels>? levels;

  DifficultyLevelsReponseModel ({
    this.message,
    this.levels,
  });

  factory DifficultyLevelsReponseModel.fromJson(Map<String, dynamic> json) {
    return _$DifficultyLevelsReponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DifficultyLevelsReponseModelToJson(this);
  }

  List<DifficultyLevelEntity> toDomain(){
    return levels!.map((e)=>e.toDomain()).toList();
  }
}

@JsonSerializable()
class Levels {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;

  Levels ({
    this.Id,
    this.name,
  });

  factory Levels.fromJson(Map<String, dynamic> json) {
    return _$LevelsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LevelsToJson(this);
  }

  DifficultyLevelEntity toDomain(){
    return DifficultyLevelEntity(
      id: Id,
      name: name
    );
  }
}


