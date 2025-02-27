
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';

import '../../../repositories/auth/auth_repository.dart';
@injectable
class UploadProfileImageUseCase {
  final AuthRepository _authRepository;

  UploadProfileImageUseCase(this._authRepository);

  Future<ApiResult<String>> invoke(File image) async {
    return _authRepository.uploadImage(image: image);
  }
}