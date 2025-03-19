import 'package:json_annotation/json_annotation.dart';

part 'all_prime_mover_by_group_id_response_model.g.dart';

@JsonSerializable()
class AllPrimeMoverByGroupIdResposneModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalMuscles")
  final int? totalMuscles;
  @JsonKey(name: "muscles")
  final List<Muscles>? muscles;

  AllPrimeMoverByGroupIdResposneModel ({
    this.message,
    this.totalMuscles,
    this.muscles,
  });

  factory AllPrimeMoverByGroupIdResposneModel.fromJson(Map<String, dynamic> json) {
    return _$AllPrimeMoverByGroupIdResposneModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllPrimeMoverByGroupIdResposneModelToJson(this);
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


