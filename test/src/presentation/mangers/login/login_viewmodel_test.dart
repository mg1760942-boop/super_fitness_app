// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:super_fitness_app/core/common/apis/api_result.dart';
// import 'package:super_fitness_app/src/domain/usecases/auth/login/login_usecase.dart';
// import 'package:super_fitness_app/src/presentation/managers/login/login_viewmodel.dart';
//
// import 'login_viewmodel_test.mocks.dart';
//
// @GenerateNiceMocks([MockSpec<LoginUsecase>()])
// void main() {
//   late MockLoginUsecase mockLoginUsecase;
//   late LoginViewmodel loginViewmodel;
//
//   setUp(() {
//     mockLoginUsecase = MockLoginUsecase();
//     // For tests that don’t need a custom formValidator,
//     // the cubit will attempt to use formKey.currentState!.validate()
//     // (which you can avoid by not calling validateFields or by providing a formValidator).
//     loginViewmodel = LoginViewmodel(mockLoginUsecase);
//   });
//
//   group('Login method tests', () {
//     blocTest<LoginViewmodel, LoginState>(
//       'should emit [LoginLoadingState, LoginSuccessState] when login is successful',
//       build: () {
//         loginViewmodel.validate = true;
//         loginViewmodel.emailController =
//             TextEditingController(text: 'omartop@gmail.com');
//         loginViewmodel.passwordController =
//             TextEditingController(text: 'Ahmed@123');
//         var success = Success<void>();
//         provideDummy<ApiResult<void>>(success);
//
//         // Provide a dummy so that even if formValidator is called it returns true.
//         loginViewmodel.formValidator = () => true;
//         when(mockLoginUsecase.login("omartop@gmail.com", "Ahmed@123"))
//             .thenAnswer((_) async => success);
//         return loginViewmodel;
//       },
//       act: (cubit) => cubit.login(),
//       expect: () => [isA<LoginLoadingState>(), isA<LoginSuccessState>()],
//     );
//
//     blocTest<LoginViewmodel, LoginState>(
//       'should emit [LoginLoadingState, LoginErrorState] when login fails',
//       build: () {
//         loginViewmodel.validate = true;
//         loginViewmodel.emailController =
//             TextEditingController(text: 'omartop@gmail.com');
//         loginViewmodel.passwordController =
//             TextEditingController(text: 'Ahmed@123');
//         var failure = Failures<void>(exception: Exception('Login failed'));
//         provideDummy<ApiResult<void>>(failure);
//         loginViewmodel.formValidator = () => true;
//         when(mockLoginUsecase.login("omartop@gmail.com", "Ahmed@123"))
//             .thenAnswer((_) async => failure);
//         return loginViewmodel;
//       },
//       act: (cubit) => cubit.login(),
//       expect: () => [isA<LoginLoadingState>(), isA<LoginErrorState>()],
//     );
//
//     blocTest<LoginViewmodel, LoginState>(
//       'should not emit any state when login is called and validate is false',
//       build: () {
//         loginViewmodel.validate = false;
//         return loginViewmodel;
//       },
//       act: (cubit) => cubit.login(),
//       expect: () => [],
//     );
//   });
//
//   group('validateFields tests', () {
//     blocTest<LoginViewmodel, LoginState>(
//       'should emit ValidateFieldsState and set validate false when email is empty',
//       build: () {
//         // Provide a formValidator that would return true if called.
//         return LoginViewmodel(mockLoginUsecase, formValidator: () => true);
//       },
//       act: (cubit) {
//         cubit.emailController.text = '';
//         cubit.passwordController.text = 'somepassword';
//         cubit.validateFields();
//       },
//       expect: () => [isA<ValidateFieldsState>()],
//       verify: (cubit) {
//         expect(cubit.validate, false);
//       },
//     );
//
//     blocTest<LoginViewmodel, LoginState>(
//       'should emit ValidateFieldsState and set validate false when password is empty',
//       build: () {
//         return LoginViewmodel(mockLoginUsecase, formValidator: () => true);
//       },
//       act: (cubit) {
//         cubit.emailController.text = 'user@example.com';
//         cubit.passwordController.text = '';
//         cubit.validateFields();
//       },
//       expect: () => [isA<ValidateFieldsState>()],
//       verify: (cubit) {
//         expect(cubit.validate, false);
//       },
//     );
//
//     blocTest<LoginViewmodel, LoginState>(
//       'should emit ValidateFieldsState and set validate false when form validator returns false',
//       build: () {
//         // Here, even though both fields are filled,
//         // the provided formValidator returns false.
//         return LoginViewmodel(mockLoginUsecase, formValidator: () => false);
//       },
//       act: (cubit) {
//         cubit.emailController.text = 'user@example.com';
//         cubit.passwordController.text = 'securePass123';
//         cubit.validateFields();
//       },
//       expect: () => [isA<ValidateFieldsState>()],
//       verify: (cubit) {
//         expect(cubit.validate, false);
//       },
//     );
//
//     blocTest<LoginViewmodel, LoginState>(
//       'should emit ValidateFieldsState and set validate true when all validations pass',
//       build: () {
//         // Provide a formValidator that returns true.
//         return LoginViewmodel(mockLoginUsecase, formValidator: () => true);
//       },
//       act: (cubit) {
//         cubit.emailController.text = 'user@example.com';
//         cubit.passwordController.text = 'securePass123';
//         cubit.validateFields();
//       },
//       expect: () => [isA<ValidateFieldsState>()],
//       verify: (cubit) {
//         expect(cubit.validate, true);
//       },
//     );
//   });
// }
