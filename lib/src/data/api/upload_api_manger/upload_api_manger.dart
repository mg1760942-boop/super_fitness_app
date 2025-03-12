import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../core/api_response_models/upload_image_response/upload_image_response.dart';
abstract class UploadApiManager {
  Future<UploadImageResponse> uploadImage({
    required File image,
    required String token,
  });
}




@Injectable(as:UploadApiManager )
class UploadApiManagerImpl implements UploadApiManager {
  final Dio _dio = Dio();
  final String baseUrl = "https://fitness.elevateegy.com/api/v1/auth/upload-photo";

  @override
  Future<UploadImageResponse> uploadImage({
    required File image,
    required String token,
  }) async {
      FormData formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      final response = await _dio.put(
        baseUrl,
        data: formData,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      return UploadImageResponse.fromJson(response.data);
  }
}
