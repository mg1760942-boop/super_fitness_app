import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/login/login_usecase.dart';

import '../register_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase loginUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(mockAuthRepository);
  });

  group('LoginUsecase', () {
    const email = 'test@example.com';
    const password = 'password';

    test(
        'should return Success<void> when repository.login returns a successful result',
        () async {
      // Arrange
      final successResult = Success<void>(data: null);
      provideDummy<ApiResult<void>>(successResult);
      when(mockAuthRepository.login(email, password))
          .thenAnswer((_) async => successResult);

      // Act
      final result = await loginUsecase.login(email, password);

      // Assert
      expect(result, successResult);
      verify(mockAuthRepository.login(email, password)).called(1);
    });

    test(
        'should return Failures<void> when repository.login returns a failure result',
        () async {
      // Arrange
      final failureResult =
          Failures<void>(exception: Exception('Login failed'));
      provideDummy<ApiResult<void>>(failureResult);
      when(mockAuthRepository.login(email, password))
          .thenAnswer((_) async => failureResult);

      // Act
      final result = await loginUsecase.login(email, password);

      // Assert
      expect(result, failureResult);
      verify(mockAuthRepository.login(email, password)).called(1);
    });
  });
}
