import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/services/connectivity_service.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_with_email_test.mocks.dart';

@GenerateMocks([LoginRepository, ConnectivityService, LoginWithEmailUseCase])
main() {
  /* Should follow the Arrange (setup), Act (call the function), Assert (confirm) */
  final repository = MockLoginRepository();
  final service = MockConnectivityService();
  final usecase = LoginWithEmailUseCase(repository, service);
  /*
  * Set up all ->
  * runs once before all tests run
  *
  * set up -> runs before each test runs
  * */
  setUpAll(() {
    when(service.isOnline()).thenAnswer((_) async => const Right(unit));
  });

  test('should verify if email is not valid', () async {
    var result = await usecase(
        LoginCredential.withEmailAndPassword(email: "", password: ""));
    expect(result.leftMap((l) => l is ErrorLoginWithEmail), const Left(true));
  });

  /*
    * Left map to explore the left error into a function
    * */
  test('should verify if password is not valid', () async {
    var result = await usecase(LoginCredential.withEmailAndPassword(
        email: "me@gmail.com", password: ""));
    expect(result.leftMap((l) => l is ErrorLoginWithEmail), const Left(true));
  });

  /* Test description contain should*/
  test('should consume repository loginWithEmail function and return user',
      () async {
    var user = UserModel(name: "null", email: "", phoneNumber: "");
    when(repository.loginWithEmail(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => Right(user));

    var result = await usecase(LoginCredential.withEmailAndPassword(
        email: "brianmutinda@flutterando.com", password: "123456"));

    expect(result, Right(user));
  });

  test('should return error when offline', () async {
    // return offline
    when(service.isOnline()).thenAnswer(
        (_) async => Left(ConnectionError(message: 'No internet connection')));

    var result = await usecase(LoginCredential.withEmailAndPassword(
        email: "brianmutinda@googleExpert.com", password: "123456"));

    expect(result.leftMap((l) => l is ConnectionError), const Left(true));
  });
}
