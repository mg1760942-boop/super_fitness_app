import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  @JsonKey(name: "message")
  final String? message;

  UploadImageResponse ({
    this.message,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) {
    return _$UploadImageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadImageResponseToJson(this);
  }
}


