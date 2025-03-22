import 'package:json_annotation/json_annotation.dart';

import '../../../../../../domain/entities/meals/meals_category_entity.dart';
import '../../../../../../domain/entities/meals/meals_rondom_entity.dart';
part 'recommendation_response_model.g.dart';
@JsonSerializable()
class RecommendationResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalMuscles")
  final int? totalMuscles;
  @JsonKey(name: "muscles")
  final List<Muscles>? muscles;

  RecommendationResponseModel ({
    this.message,
    this.totalMuscles,
    this.muscles,
  });

  factory RecommendationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RecommendationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecommendationResponseModelToJson(this);
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

  MealsRandomEntity toEntity() {
    return MealsRandomEntity(
      id: Id ?? "",
      name: name ?? "",
      image: image ?? "",
    );
  }
}


