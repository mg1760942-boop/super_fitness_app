import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';

import '../../../repositories/auth/auth_repository.dart';

@injectable
class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<ApiResult<void>> login(String email, String password) async {
    return await repository.login(email, password);
  }
}
