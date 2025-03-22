
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/auth/logout_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class LogoutUseCase{

  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<ApiResult<LogoutEntity>> logout()async{
    return await _authRepository.logout();
  }
}