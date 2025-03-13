import 'package:json_annotation/json_annotation.dart';

part 'random_muscles_response_model.g.dart';

@JsonSerializable()
class RandomMusclesResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalMuscles")
  final int? totalMuscles;
  @JsonKey(name: "muscles")
  final List<Muscles>? muscles;

  RandomMusclesResponseModel ({
    this.message,
    this.totalMuscles,
    this.muscles,
  });

  factory RandomMusclesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RandomMusclesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RandomMusclesResponseModelToJson(this);
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


