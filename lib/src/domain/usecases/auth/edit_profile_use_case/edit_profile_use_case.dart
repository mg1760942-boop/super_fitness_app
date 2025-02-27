import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

import '../../../../data/api/core/api_request_models/edit_profile_request/edit_profile_request.dart';
import '../../../repositories/auth/auth_repository.dart';

@injectable
class EditProfileUseCase {
  final AuthRepository _authRepository;
  EditProfileUseCase(this._authRepository);

 Future<ApiResult<AppUserEntity>>invoke({
    required EditProfileRequest editProfileRequest,
})async{
   return  await _authRepository.editProfile(editProfileRequest: editProfileRequest);
 }
}