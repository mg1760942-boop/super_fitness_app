import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class ProfileUsecase {
  final AuthRepository repository;

  ProfileUsecase(this.repository);

  Future<ApiResult<AppUserEntity?>> call() async {
    return await repository.getUserData();
  }
}
