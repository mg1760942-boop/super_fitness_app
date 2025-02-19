import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/login/login_usecase.dart';
import 'package:super_fitness_app/src/presentation/managers/login/login_viewmodel.dart';

import 'login_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoginUsecase>(),
  MockSpec<FormState>(),
  MockSpec<GlobalKey>(),
])
void main() {
  late MockLoginUsecase mockLoginUsecase;
  late LoginViewmodel loginViewmodel;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginViewmodel = LoginViewmodel(mockLoginUsecase);
  });

  group('Login method tests', () {
    blocTest<LoginViewmodel, LoginState>(
      'should emit [LoginLoadingState, LoginSuccessState] when login is successful',
      build: () {
        loginViewmodel.emailController =
            TextEditingController(text: 'omartop@gmail.com');
        loginViewmodel.passwordController =
            TextEditingController(text: 'Ahmed@123');

        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();

        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(true);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;

        loginViewmodel.validateFields();

        var success = Success<void>();
        provideDummy<ApiResult<void>>(success);
        when(mockLoginUsecase.login("omartop@gmail.com", "Ahmed@123"))
            .thenAnswer((_) async => success);
        return loginViewmodel;
      },
      act: (cubit) => cubit.login(),
      expect: () => [
        isA<LoginLoadingState>(),
        isA<LoginSuccessState>(),
      ],
    );

    blocTest<LoginViewmodel, LoginState>(
      'should emit [LoginLoadingState, LoginErrorState] when login fails',
      build: () {
        loginViewmodel.emailController =
            TextEditingController(text: 'omartop@gmail.com');
        loginViewmodel.passwordController =
            TextEditingController(text: 'Ahmed@123');

        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();

        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(true);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;
        loginViewmodel.validateFields();

        var failure = Failures<void>(exception: Exception('Login failed'));
        provideDummy<ApiResult<void>>(failure);
        when(mockLoginUsecase.login("omartop@gmail.com", "Ahmed@123"))
            .thenAnswer((_) async => failure);
        return loginViewmodel;
      },
      act: (cubit) => cubit.login(),
      expect: () => [
        isA<LoginLoadingState>(),
        isA<LoginErrorState>(),
      ],
    );

    blocTest<LoginViewmodel, LoginState>(
      'should not emit any state when login is called and validate is false',
      build: () {
        loginViewmodel.emailController = TextEditingController(text: '');
        loginViewmodel.passwordController = TextEditingController(text: '');

        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();
        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(true);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;
        loginViewmodel.validateFields();
        return loginViewmodel;
      },
      act: (cubit) => cubit.login(),
      expect: () => [],
    );
  });

  group('validateFields tests', () {
    blocTest<LoginViewmodel, LoginState>(
      'should emit ValidateFieldsState and set validate false when email is empty',
      build: () {
        loginViewmodel = LoginViewmodel(mockLoginUsecase);
        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();
        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(true);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;
        return loginViewmodel;
      },
      act: (cubit) {
        cubit.emailController.text = '';
        cubit.passwordController.text = 'somepassword';
        cubit.validateFields();
      },
      expect: () => [isA<ValidateFieldsState>()],
      verify: (cubit) {
        expect(cubit.validate, isFalse);
      },
    );

    blocTest<LoginViewmodel, LoginState>(
      'should emit ValidateFieldsState and set validate false when password is empty',
      build: () {
        loginViewmodel = LoginViewmodel(mockLoginUsecase);
        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();
        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(true);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;
        return loginViewmodel;
      },
      act: (cubit) {
        cubit.emailController.text = 'user@example.com';
        cubit.passwordController.text = '';
        cubit.validateFields();
      },
      expect: () => [isA<ValidateFieldsState>()],
      verify: (cubit) {
        expect(cubit.validate, isFalse);
      },
    );

    blocTest<LoginViewmodel, LoginState>(
      'should emit ValidateFieldsState and set validate false when form validation fails',
      build: () {
        loginViewmodel = LoginViewmodel(mockLoginUsecase);
        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();
        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(false);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;
        return loginViewmodel;
      },
      act: (cubit) {
        cubit.emailController.text = 'user@example.com';
        cubit.passwordController.text = 'securePass123';
        cubit.validateFields();
      },
      expect: () => [isA<ValidateFieldsState>()],
      verify: (cubit) {
        expect(cubit.validate, isFalse);
      },
    );

    blocTest<LoginViewmodel, LoginState>(
      'should emit ValidateFieldsState and set validate true when all validations pass',
      build: () {
        loginViewmodel = LoginViewmodel(mockLoginUsecase);
        final mockFormKey = MockGlobalKey();
        final mockFormState = MockFormState();
        when(mockFormKey.currentState).thenReturn(mockFormState);
        when(mockFormState.validate()).thenReturn(true);

        loginViewmodel.formKey = mockFormKey as GlobalKey<FormState>;
        return loginViewmodel;
      },
      act: (cubit) {
        cubit.emailController.text = 'user@example.com';
        cubit.passwordController.text = 'securePass123';
        cubit.validateFields();
      },
      expect: () => [isA<ValidateFieldsState>()],
      verify: (cubit) {
        expect(cubit.validate, isTrue);
      },
    );
  });
}
