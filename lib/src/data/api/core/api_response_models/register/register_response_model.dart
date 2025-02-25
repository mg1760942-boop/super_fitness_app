import 'package:json_annotation/json_annotation.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "token")
  final String? token;

  RegisterResponseModel({
    this.message,
    this.user,
    this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseModelToJson(this);
  }

  AppUserEntity toAppUserEntity() {
    return AppUserEntity(
      firstName: user?.firstName ?? "",
      lastName: user?.lastName ?? "",
      email: user?.email ?? "",
      gender: user?.gender ?? "",
      height: user?.height ?? 0,
      activityLevel: user?.activityLevel ?? "",
      age: user?.age ?? 0,
      goal: user?.goal ?? "",
      weight: user?.weight ?? 0.0,
      photo: user?.photo ?? "",
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "age")
  final int? age;
  @JsonKey(name: "weight")
  final int? weight;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "activityLevel")
  final String? activityLevel;
  @JsonKey(name: "goal")
  final String? goal;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.Id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  AppUserEntity toAppUserEntity() {
    return AppUserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      height: height,
      activityLevel: activityLevel,
      age: age,
      goal: goal,
      weight: weight,
      photo: photo,
    );
  }
}
